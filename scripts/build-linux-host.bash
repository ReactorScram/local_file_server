#!/usr/bin/env bash

# See https://reproducible-builds.org/docs/rust/

set -euox pipefail

TARGET_LINUX=x86_64-unknown-linux-gnu
TARGET_WINDOWS=x86_64-pc-windows-gnu

cargo build --locked --release --target $TARGET_LINUX
cargo build --locked --release --target $TARGET_WINDOWS

sha256sum target/$TARGET_LINUX/release/local_file_server
sha256sum target/$TARGET_WINDOWS/release/local_file_server.exe
