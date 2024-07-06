#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGES_DIR="${ROOT_DIR}/packages"
DIST_DIR="${ROOT_DIR}/dist"

echo "## Packages"
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
    echo "#### Supported devices"
    echo

    for dev in "${device_definitions[@]}"; do
        echo "- \`${dev}\`"
    done
    echo
    echo
done
