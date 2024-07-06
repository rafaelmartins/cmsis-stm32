#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DIST_DIR="${ROOT_DIR}/dist"

echo -n "set(STM32_FAMILIES"
for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    family="$(echo "${full}" | cut -d- -f2)"
    echo -n " ${family}"
done
echo ")"

for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    family="$(echo "${full}" | cut -d- -f2)"
    echo "set(STM32_DIST_${family} \"${full}\")"
    echo "set(STM32_DIST_MD5_${family} \"$(md5sum "${pkg}" | cut -d' ' -f1)\")"
done
echo
