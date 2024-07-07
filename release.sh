#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGES_DIR="${ROOT_DIR}/packages"
DIST_DIR="${ROOT_DIR}/dist"

echo "## Packages"
echo
echo "Each device definition may support more devices than those matching its pattern."
echo "Please check the main device header for details."
echo

for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    for i in "${PACKAGES_DIR}"/*.sh; do
        if [[ "${full}" = "$(basename "${i%.*}")"-* ]]; then
            . "${i}"
            break
        fi
    done
    if [[ -z "${family_definition}" ]]; then
        continue
    fi

    echo "### \`${family_definition}\` (\`${full}\`)"
    echo
    echo "${description}"
    echo
    echo "#### Device header"
    echo
    echo "\`${family_definition,,}.h\`"
    echo
    echo "#### Device definitions"
    echo

    for dev in "${device_definitions[@]}"; do
        echo "- \`${dev}\`"
    done
    echo
    echo
done
