#!/bin/bash

pushd frameworks/base/
git checkout master
popd

pushd system/core/
git checkout master
popd

pushd system/netd/
git checkout master
popd

pushd packages/apps/Phone/
git checkout gingerbread-release
popd

pushd packages/apps/Settings/
git checkout master
popd

pushd packages/apps/Stk/
git checkout gingerbread-release
popd

pushd packages/providers/TelephonyProvider/
git checkout gingerbread-release
popd


