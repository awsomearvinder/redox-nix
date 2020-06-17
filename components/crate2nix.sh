#!/bin/sh

: "${1?./crate2nix.sh <project name>}"

set -e

pushd "$1"
crate2nix generate
popd

cp "$1/Cargo.nix" "components/$1/Cargo.nix"
