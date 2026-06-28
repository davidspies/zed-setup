#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <user@host-or-host>"
  exit 1
fi

remote_server_target="${REMOTE_SERVER_TARGET:-x86_64-unknown-linux-musl}"
remote_server_path="zed/target/${remote_server_target}/release/remote_server"

if [[ ! -x "$remote_server_path" ]]; then
  echo "Remote server binary not found at $remote_server_path"
  echo "Run ./install.sh first, or set REMOTE_SERVER_TARGET to the target you built."
  exit 1
fi

rsync -zhP "$remote_server_path" "$1":~/.zed_server/zed-remote-server-dev-build
