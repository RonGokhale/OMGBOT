#!/bin/bash

pushd ~/OMGB

. build/envsetup.sh
lunch 6
make otapackage -j$(grep processor /proc/cpuinfo | wc -l)

pushd build/
git checkout master
popd

popd
. OMGBOT/upload.sh

