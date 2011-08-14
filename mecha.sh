#!/bin/bash

pushd ~/OMGB

rm -rf packages/apps/CMWimaxSettings/

pushd frameworks/base/
git checkout mecha
popd

pushd system/core/
git checkout mecha
popd

pushd system/netd/
git checkout mecha
popd

pushd packages/apps/Phone/
git checkout mecha
popd

pushd packages/apps/Settings/
git checkout mecha
popd

pushd packages/apps/Stk/
git checkout mecha
popd

pushd packages/providers/TelephonyProvider/
git checkout mecha
popd

. build/envsetup.sh
lunch 5
make otapackage -j$(grep processor /proc/cpuinfo | wc -l)

. ../OMGBOT/branch_reset.sh

repo sync -j$(grep processor /proc/cpuinfo | wc -l)

popd
. OMGBOT/upload.sh


