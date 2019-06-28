#!/usr/bin/env bash

set -e

dontOverrideCC() {
    vars=("AR" "AS" "CC" "CXX" "LD" "NM" "OBJCOPY" "OBJDUMP" "RANLIB"
          "READELF" "STRIP")
    regex="$(printf "\|%s" "${vars[@]}")"
    regex="\(${regex:2}\)"

    find . -name "*.mk" -exec sed -i "s/\<$regex\>/_\1/g" "{}" \;
}

dontUseBinaries() {
    sed -i "s/^PREFIX_BINARY\?=.*$/PREFIX_BINARY?=0/" config.mk
}

cd "$(dirname "$0")"

pushd "redox/mk" > /dev/null
dontOverrideCC
dontUseBinaries
popd > /dev/null
