#!/usr/bin/env bash

dontOverrideCC() {
    vars=("AR" "AS" "CC" "CXX" "LD" "NM" "OBJCOPY" "OBJDUMP" "RANLIB"
          "READELF" "STRIP")
    regex="$(printf "\|%s" "${vars[@]}")"
    regex="\(${regex:2}\)"

    pushd "redox/mk"
    find . -name "*.mk" -exec sed -i "s/\<$regex\>/_\1/g" "{}" \;
    popd
}

dontOverrideCC > /dev/null
