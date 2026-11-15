#!/usr/bin/env bash

# See https://reproducible-builds.org/docs/rust/

set -euo pipefail

TARGET_LINUX=x86_64-unknown-linux-gnu
TARGET_WINDOWS=x86_64-pc-windows-gnu

export CROSS_CONTAINER_ENGINE=podman

cargo +stable install cross --locked --git https://github.com/cross-rs/cross --rev a9301e91f72bba3850460512685f6b16062015ff

cross build --locked --release --target $TARGET_LINUX
cross build --locked --release --target $TARGET_WINDOWS

sha256sum target/$TARGET_LINUX/release/local_file_server
sha256sum target/$TARGET_WINDOWS/release/local_file_server.exe

# On local desktop
# 908e6af05d70d1a932fee2114ba706a0a8a1a3d79b4b2fa727f23a42580b20cc  target/x86_64-unknown-linux-gnu/release/local_file_server
# 82b3272b0782c5e919ca981977ac9af6e2fd468e10a084e165234baa12c01276  target/x86_64-pc-windows-gnu/release/local_file_server.exe

# On GitHub Actions runner
# b16ba8b17214ad1af64326ac3c6c19d35501fd0c62c5521ca15f78292e909c93  untracked/github-builds/local_file_server
# 40d6e2699f304e95d178034dfcb96ac668b378332a21f7647c315d90b7689ae3  untracked/github-builds/local_file_server.exe
