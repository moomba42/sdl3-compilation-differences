#!/bin/sh

echo "Loading the cmake library"
java LoadLibrary.java "$(dirname "$0")/lib/libSDL3-cmake.dylib"
echo ""
echo "Loading the zig library"
java LoadLibrary.java "$(dirname "$0")/lib/libSDL3.dylib"
