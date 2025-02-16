#!/bin/sh

cd "$(dirname "$0")" || exit
mkdir lib

echo "Compiling SDL using CMake into 'lib'"
git clone https://github.com/libsdl-org/SDL sdl-cmake
cd sdl-cmake || exit
mkdir build
cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release --parallel
cd ../../
cp sdl-cmake/build/libSDL3.dylib lib/libSDL3-cmake.dylib
# Update the self reference
install_name_tool -id @rpath/libSDL3-cmake.dylib ./lib/libSDL3-cmake.dylib

echo "Compiling SDL using Zig into 'lib'"
git clone https://github.com/castholm/SDL sdl-zig
cd sdl-zig || exit
zig build -Dpreferred_link_mode=dynamic --release=fast
cd .. || exit
cp sdl-zig/zig-out/lib/libSDL3.dylib lib/libSDL3-zig.dylib
# Update the self reference
install_name_tool -id @rpath/libSDL3-zig.dylib ./lib/libSDL3-zig.dylib

