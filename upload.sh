#!/bin/bash

#Pull in info from config file.
. ~/OMGBOT/OMFBOT_config

#Upload file to FTP
ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
prompt
cd $REMOTEDIR
lcd ~/OMGB/out/target/product/$DEVICE/
put $ZIP
bye
EOT

#Announce new Nightly build.
if [ ! -z $DEVICE ]
then
ttytter -status="New OMGB build for $DEVICE available http://r2doesinc.bitsurge.net/omgb/$DEVICE/$ZIP"
ttytter -status="Md5 for $ZIP : $MD5 "
else
ttytter -status="Bot errored. Blame @Framework43 $RANDOM times."
fi

#Update device nightly manifests.
pushd ~/OMGBOT/
rm -rf $MANIFESTDIR
git clone $MANIFESTREPO
pushd $MANIFESTDIR
git checkout -b master origin/master
git checkout master
sed -i "1 a\\$MANIFESTENTRY" omgb/$DEVICE.js
git add omgb/$DEVICE.js
git commit -m "New OMGB build for $DEVICE. Via @OMFBOT"
git push
popd

cd ~/

pushd ~/OMGB
make clean
popd
