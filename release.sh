set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
PACKAGES_DIR="${ROOT_DIR}/packages"
DIST_DIR="${ROOT_DIR}/dist"

echo "### Packages"
echo

for pkg in "${DIST_DIR}"/*.tar.xz; do
    full="$(basename "${pkg%.*.*}")"
    echo -n "- **${full}**"
    for i in "${PACKAGES_DIR}"/*.sh; do
        if [[ "${full}" = "$(basename "${i%.*}")"-* ]]; then
            . "${i}"
            echo -n ": ${description}"
            break
        fi
    done
    echo
done
echo
