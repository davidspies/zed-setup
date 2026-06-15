#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <user@host-or-host>"
  exit 1
fi

rsync -zhP zed/target/x86_64-unknown-linux-musl/release/remote_server "$1":~/.zed_server/zed-remote-server-dev-build
