#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DIST_DIR="${ROOT_DIR}/dist"

if [[ -z "${CMSIS_TIMESTAMP:-}" ]]; then
    CMSIS_TIMESTAMP="$(date +%Y%m%d%H%M%S)"
fi

echo "set(STM32_CMSIS_VERSION \"${CMSIS_TIMESTAMP}\")"

echo -n "set(STM32_CMSIS_FAMILIES"
for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    family="$(echo "${full}" | cut -d- -f2)"
    echo -n " ${family}"
done
echo ")"

for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    family="$(echo "${full}" | cut -d- -f2)"
    echo "set(STM32_CMSIS_DIST_${family} \"${full}\")"
    echo "set(STM32_CMSIS_DIST_MD5_${family} \"$(md5sum "${pkg}" | cut -d' ' -f1)\")"
done
echo
