#!/bin/sh

: "${1?./carnix.sh <project name>}"

set -e

pushd "$1"
carnix generate-nix --src .
popd

cp "$1/Cargo.nix" "components/$1/$1.nix"
cp "$1/crates-io.nix" "components/$1/crates-io.nix"
