#!/bin/bash

pushd ~/OMGB
. build/envsetup.sh
lunch 12
make otapackage -j$(grep processor /proc/cpuinfo | wc -l)

popd
. OMGBOT/upload.sh


