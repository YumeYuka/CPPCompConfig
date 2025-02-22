#!/bin/bash
set -eu

TARGET_ARCH="arm64-v8a"
NDK_PATH="C:/tool/Android-NDK"
TOOLCHAIN="$NDK_PATH/toolchains/llvm/prebuilt/windows-x86_64"
API_LEVEL=21
CROSS_PREFIX="$TOOLCHAIN/bin/aarch64-linux-android$API_LEVEL-"

SRC_DIR="src"
BUILD_DIR="build"
SRC_FILE="$SRC_DIR/main.cpp"
OUTPUT_FILE="$BUILD_DIR/test"

COMPILE_FLAGS="-std=c++20 -Wall -static -s -Oz -g0 -ffat-lto-objects -flto -funified-lto -fwhole-program-vtables  -fvirtual-function-elimination -fcommon -fdata-sections -fdiscard-value-names -ffunction-sections -finline-functions -fjump-tables -fmerge-all-constants -fomit-frame-pointer -Wl,--strip-all"

echo "Creating build directory: $BUILD_DIR"
mkdir -p "$BUILD_DIR"

echo "Compiling source files: $SRC_FILE with flags: $COMPILE_FLAGS"
"${CROSS_PREFIX}clang++" $COMPILE_FLAGS $SRC_FILE -o "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Compilation successful. Output file: $OUTPUT_FILE"
else
    echo "Compilation failed."
    exit 1
fi