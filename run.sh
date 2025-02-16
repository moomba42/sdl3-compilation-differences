#!/bin/sh

echo "Loading the cmake library"
java LoadLibrary.java "$PWD/lib/libSDL3-cmake.dylib"
echo ""
echo "Loading the zig library"
java LoadLibrary.java "$PWD/lib/libSDL3.dylib"
