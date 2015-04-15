#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

IPREFIX="${1}"
INAME="${2}"
ITAG="${3}"

DOCKERDIR="${SCRIPTDIR}/../images/${IPREFIX}-${INAME}/${ITAG}"

cd "${DOCKERDIR}/bootstrap"
sha512sum --check --strict 'sha512sum.txt' "${DOCKERDIR}/checksums/bootstrap_sha512sum.txt"

docker build --tag="nrandell/${IPREFIX}-${INAME}:${ITAG}" "${DOCKERDIR}"
