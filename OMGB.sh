#!/bin/bash

#Clean the build
pushd ~/OMGB
. ../OMGBOT/branch_reset.sh
#make clobber
popd

#Pull config from file.
. OMGBOT/OMFBOT_config

pushd ~/OMGB

#Pull in all new changes, and reset back to HEAD to be sure no testing commits are included.
repo forall -c git branch -D  mecha
repo forall -c git reset HEAD --hard
repo sync -j9

#Setup mecha branches
pushd frameworks/base/
git checkout -b mecha github/mecha
git pull github mecha
git checkout -b master github/master
popd

pushd system/core/
git checkout -b mecha origin/mecha
git pull origin mecha
git checkout -b master origin/master
popd

pushd system/netd/
git checkout -b mecha origin/mecha
git pull origin mecha
git checkout -b master origin/master
popd

pushd packages/apps/Phone/
git remote add origin git@github.com:OMFGB/packages_apps_Phone.git
git fetch --all
git checkout -b mecha origin/mecha
git pull origin mecha
git checkout -b gingerbread-release korg/gingerbread-release
popd

pushd packages/apps/Settings/
git checkout -b mecha github/mecha
git pull github mecha
git checkout -b master github/master
popd

pushd packages/apps/Stk/
git remote add origin git@github.com:OMFGB/packages_apps_Stk.git
git fetch --all
git checkout -b mecha origin/mecha
git pull origin mecha
git checkout -b gingerbread-release korg/gingerbread-release
popd

pushd packages/providers/TelephonyProvider/
git remote add origin git@github.com:OMFGB/packages_providers_TelephonyProvider.git
git fetch --all
git checkout -b mecha origin/mecha
git pull origin mecha
git checkout -b gingerbread-release korg/gingerbread-release
popd

. ../OMGBOT/branch_reset.sh

#Start builds. These can be reordered.
#ttytter -status="OMGB builds beginning now."

cd ~/

#./OMGBOT/fascinatemtd.sh

#./OMGBOT/mecha.sh

#./OMGBOT/shadow.sh

#./OMGBOT/inc.sh

#./OMGBOT/vivow.sh

#./OMGBOT/supersonic.sh

#./OMGBOT/sholes.sh

#./OMGBOT/desirec.sh

#./OMGBOT/heroc.sh

./OMGBOT/mesmerizemtd.sh

./OMGBOT/showcasemtd.sh

exit

