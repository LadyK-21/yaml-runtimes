#!/bin/sh

set -x
cd /tmp
cp $SOURCE .
tar xvf $VERSION.tar.gz
cd yaml-cpp-$VERSION

mkdir build
cd build

cmake -DBUILD_SHARED_LIBS=OFF ..
make yaml-cpp
cp -r ../include/yaml-cpp .

g++ -Wall -I. -L. -std=gnu++11  \
        -lyaml-cpp -o /build/bin/cpp-event \
        /buildutils/yaml-cpp-event.cpp libyaml-cpp.a

rm -fr build

