#!/bin/sh

set -eu
PROGRAM="${0}"

while [ -h "${PROGRAM}" ]; do
    LS=$(ls -ld "${PROGRAM}")
    LINK=$(expr "${LS}" : '.*-> \(.*\)$')

    if expr "${LINK}" : '.*/.*' > /dev/null; then
        PROGRAM="${LINK}"
    else
        PROGRAM=$(dirname "${PROGRAM}")/"${LINK}"
    fi
done

PROGRAM=$(realpath "${PROGRAM}")
PROGRAM_DIRECTORY=$(dirname "${PROGRAM}")

for dir in "${PROGRAM_DIRECTORY}/img-"*/; do
    if [ -e "${dir}/release.sh" ]; then
        (
            cd "${dir}" || exit
            ./release.sh
        )
    fi
done


