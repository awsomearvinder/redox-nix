#!/usr/bin/env bash

set -e

dontOverrideCC() {
    vars=("AR" "AS" "CC" "CXX" "LD" "NM" "OBJCOPY" "OBJDUMP" "RANLIB"
          "READELF" "STRIP")
    regex="$(printf "\|%s" "${vars[@]}")"
    regex="\(${regex:2}\)"

    find . -name "*.mk" -exec sed -i "s/\<$regex\>/_\1/g" "{}" \;
}
patchPrefix() {
    patch prefix.mk ../../patch-prefix.patch --forward
}

cd "$(dirname "$0")"

pushd "redox/mk" > /dev/null
dontOverrideCC
patchPrefix
popd > /dev/null
