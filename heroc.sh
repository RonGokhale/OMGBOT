#!/bin/bash

pushd ~/OMGB
. build/envsetup.sh
lunch 3
make otapackage -j$(grep processor /proc/cpuinfo | wc -l)

popd
. OMGBOT/upload.sh


