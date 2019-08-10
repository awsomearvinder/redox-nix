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
    sed -i "s/^PREFIX_BINARY?=.*$/PREFIX_BINARY?=0/" config.mk
    sed -i "s/^PREFIX_RUSTC?=.*$/PREFIX_RUSTC?=0/" config.mk
}
fixXargoDeadlock() {
    # Not nix-specific and will probably be fixed soon
    sed -i "s/export CARGO=xargo/export CARGO=\"env -u CARGO xargo\"/" prefix.mk
}

cd "$(dirname "$0")"

pushd "redox/mk" > /dev/null
dontOverrideCC
dontUseBinaries
fixXargoDeadlock
popd > /dev/null
