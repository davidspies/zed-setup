#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cd "$script_dir/zed"
export BUILD_MEMORY_LIMIT_KIB="${BUILD_MEMORY_LIMIT_KIB:-8388608}"
export CARGO_BUILD_JOBS="${CARGO_BUILD_JOBS:-2}"
export REMOTE_SERVER_TARGET="${REMOTE_SERVER_TARGET:-x86_64-unknown-linux-musl}"
export CC_x86_64_unknown_linux_musl="${CC_x86_64_unknown_linux_musl:-musl-gcc}"
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER="${CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER:-musl-gcc}"

ulimit -v "$BUILD_MEMORY_LIMIT_KIB"

./script/install-linux
