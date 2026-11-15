#!/usr/bin/env bash

# 20 seconds if everything's already built
# 70 seconds after `cargo clean`

set -euo pipefail

SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)
TARGET_LINUX=x86_64-unknown-linux-gnu
TARGET_WINDOWS=x86_64-pc-windows-gnu

export CROSS_CONTAINER_ENGINE=podman
export SOURCE_DATE_EPOCH

cargo +stable install cross --locked --git https://github.com/cross-rs/cross --rev a9301e91f72bba3850460512685f6b16062015ff

cross build --locked --release --target $TARGET_LINUX
cross build --locked --release --target $TARGET_WINDOWS

sha256sum target/$TARGET_LINUX/release/local_file_server
sha256sum target/$TARGET_WINDOWS/release/local_file_server.exe

# On local desktop
# 908e6af05d70d1a932fee2114ba706a0a8a1a3d79b4b2fa727f23a42580b20cc  target/x86_64-unknown-linux-gnu/release/local_file_server
# 76026fa657f9aa0593cfb825e003243fc8a2506d72011f25b0d31c9d1334ac33  target/x86_64-pc-windows-gnu/release/local_file_server.exe

# On GitHub Actions runner
# 81d27bd8fe8a60d719dfb0851c0910081522031efc14f8adf4b2f1ab7da58e62  untracked/github-builds/local_file_server
# 339af79c36b23b6d116a85c12b29b2582b615bf23f03c1b6006accb328a3d54d  untracked/github-builds/local_file_server.exe
