cmake_minimum_required(VERSION 3.30)
project(test)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_TOOLCHAIN_FILE "C:/tool/Android-NDK/build/cmake/android.toolchain.cmake")
set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 21)
set(CMAKE_ANDROID_ABI "arm64-v8a","armeabi-v7a", "x86_64")
set(CMAKE_ANDROID_NDK "C:/tool/Android-NDK")

set(CMAKE_CXX_FLAGS "-std=c++26 -Wall -static -Oz -g0 -ffat-lto-objects -flto -funified-lto -fwhole-program-vtables -fvirtual-function-elimination -fcommon -fdata-sections -fdiscard-value-names -ffunction-sections -finline-functions -fjump-tables -fmerge-all-constants -fomit-frame-pointer -Wl,--strip-all")
set(CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION clang++)

add_executable(test src/main.cpp)
