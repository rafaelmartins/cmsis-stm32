#!/bin/bash

set -Eeuo pipefail

function die() {
    echo "error:" "${@}" > /dev/stderr
    exit 1
}

if [[ $# -ne 1 ]]; then
    die "invalid number of arguments"
fi

PACKAGE="${1}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGES_DIR="${ROOT_DIR}/packages"
DIST_DIR="${ROOT_DIR}/dist"

REQUIRED_PACKAGE_VARS=(
    cmsis_headers
    cpu
    description
    device_definitions
    family_definition
    fpu
    github_repository
    license
    version
)

if [[ ! -f "${PACKAGES_DIR}/${PACKAGE}.sh" ]]; then
    die "package not found: ${PACKAGE}"
fi

if [[ -z "${CMSIS_TIMESTAMP:-}" ]]; then
    CMSIS_TIMESTAMP="$(date +%Y%m%d%H%M%S)"
fi

. "${PACKAGES_DIR}/${PACKAGE}.sh"

for var in ${REQUIRED_PACKAGE_VARS[@]}; do
    if ! declare -p $var &> /dev/null; then
        die "missing package variable: ${var}"
    fi
done

PN="${PACKAGE}"
PV="${version}-${CMSIS_TIMESTAMP}"
P="${PN}-${PV}"

tmpdir="$(mktemp -d)"
trap 'rm -rf -- "${tmpdir}"' EXIT
REPODIR="${tmpdir}/repo"
PKGDIR="${tmpdir}/pkg"

git clone \
    -c advice.detachedHead=false \
    --recursive \
    --branch "v${version}" \
    "https://github.com/${github_repository}.git" \
    "${REPODIR}"

mkdir -p "${PKGDIR}/${P}"/{cmake,include,src}

for dev in "${device_definitions[@]}"; do
    fpu_var="fpu_${dev}"
    fpu_arr=()
    if [[ -n "${!fpu_var:-}" ]]; then
        fpu_arr+=("-mfpu=${!fpu_var}" "-mfloat-abi=hard")
    elif [[ -n "${fpu}" ]]; then
        fpu_arr+=("-mfpu=${fpu}" "-mfloat-abi=hard")
    fi
    fpu_val=
    if [[ ${#fpu_arr[@]} -gt 0 ]]; then
        fpu_val="$(echo -e "\n    ${fpu_arr[@]}")"
    fi

    cat > "${PKGDIR}/${P}/cmake/${dev,,}.cmake" <<EOF
function(stm32_cmsis_add_library_${dev,,} name)
    if(TARGET \${name})
        return()
    endif()

    add_library(\${name} INTERFACE IMPORTED)

    target_sources(\${name} INTERFACE
        \${CMAKE_CURRENT_LIST_DIR}/../src/startup_${dev,,}.s
        \${CMAKE_CURRENT_LIST_DIR}/../src/system_${family_definition,,}.c
    )

    target_include_directories(\${name} INTERFACE
        \${CMAKE_CURRENT_LIST_DIR}/../include
    )

    target_compile_definitions(\${name} INTERFACE
        ${family_definition}=1
        ${dev}=1
    )

    target_compile_options(\${name} INTERFACE
        -mcpu=${cpu}${fpu_val}
        -mthumb
    )

    target_link_options(\${name} INTERFACE
        -mcpu=${cpu}${fpu_val}
        -mthumb
        -specs=nano.specs
        -Wl,--gc-sections
        -Wl,--no-warn-rwx-segments
    )
endfunction()
EOF
done

for hdr in "${cmsis_headers[@]}"; do
    cp \
        --verbose \
        "${REPODIR}/Drivers/CMSIS/Core/Include/${hdr}" \
        "${PKGDIR}/${P}/include/"
done

for dev in "${device_definitions[@]}"; do
    cp \
        --verbose \
        "${REPODIR}/Drivers/CMSIS/Device/ST/${family_definition}/Include/${dev,,}.h" \
        "${PKGDIR}/${P}/include/"

    cp \
        --verbose \
        "${REPODIR}/Drivers/CMSIS/Device/ST/${family_definition}/Source/Templates/gcc/startup_${dev,,}.s" \
        "${PKGDIR}/${P}/src/"
done

cp \
    --verbose \
    "${REPODIR}/Drivers/CMSIS/Device/ST/${family_definition}/Include/"{,system_}"${family_definition,,}.h" \
    "${PKGDIR}/${P}/include/"

if [[ -n "${system_source:-}" ]]; then
    cp \
        --verbose \
        "${REPODIR}/Drivers/CMSIS/Device/ST/${family_definition}/Source/Templates/${system_source}" \
        "${PKGDIR}/${P}/src/system_${family_definition,,}.c"
else
    cp \
        --verbose \
        "${REPODIR}/Drivers/CMSIS/Device/ST/${family_definition}/Source/Templates/system_${family_definition,,}.c" \
        "${PKGDIR}/${P}/src/"
fi

wget \
    --output-document="${PKGDIR}/${P}/LICENSE" \
    "https://spdx.org/licenses/${license}.txt"

mkdir -p "${DIST_DIR}"

tar \
    --create \
    --verbose \
    --xz \
    --directory="${PKGDIR}" \
    --file="${DIST_DIR}/${P}.tar.xz" \
    "${P}"
