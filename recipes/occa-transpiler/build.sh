#!/usr/bin/env bash

# Get rid of these once occa-transpiler is packaged
# correctly.
git submodule init
git submodule update

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
		..

cmake --build . -- -j$(( CPU_COUNT>4 ? 4 : CPU_COUNT ))
cmake --build . --target install
