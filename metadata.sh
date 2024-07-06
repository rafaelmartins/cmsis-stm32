#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGES_DIR="${ROOT_DIR}/packages"

packages=()
for pkg in "${PACKAGES_DIR}"/*.sh; do
    packages+=("$(basename "${pkg%.*}")")
done

jq \
    -cnM \
    '$ARGS.positional' \
    --args "${packages[@]}"
