#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DIST_DIR="${ROOT_DIR}/dist"

if [[ -z "${CMSIS_TIMESTAMP:-}" ]]; then
    CMSIS_TIMESTAMP="$(date +%Y%m%d%H%M%S)"
fi

tmpdir="$(mktemp -d)"
trap 'rm -rf -- "${tmpdir}"' EXIT

mkdir -p "${tmpdir}/stm32-cmsis-${CMSIS_TIMESTAMP}"
pushd "${tmpdir}/stm32-cmsis-${CMSIS_TIMESTAMP}" > /dev/null

for pkg in "${DIST_DIR}"/*.tar.xz; do
    dir="cmsis-$(echo "$(basename "${pkg}")" | cut -d- -f2)"
    mkdir "${dir}"
    pushd "${dir}" > /dev/null

    tar \
        --extract \
        --verbose \
        --file="${pkg}" \
        --strip-components=1

    popd > /dev/null
done

if [[ ! -f "${DIST_DIR}/index.cmake" ]]; then
    "${ROOT_DIR}/cmake-index.sh" > "${DIST_DIR}/index.cmake"
fi

cp \
    --verbose \
    "${DIST_DIR}/index.cmake" \
    index.cmake

popd > /dev/null

tar \
    --create \
    --verbose \
    --xz \
    --directory="${tmpdir}" \
    --file="${DIST_DIR}/stm32-cmsis-${CMSIS_TIMESTAMP}.tar.xz" \
    "stm32-cmsis-${CMSIS_TIMESTAMP}"
