#!/bin/bash

#User defined variables
Src="/opt/working/"
Dest="/var/www/html"
Login_Name="root"
Dest_IP="54.198.18.170"

#Cloning from git repo
cd $Src
rm -rf webdeploy
git clone https://github.com/watchmen-test/webdeploy.git

#Copying files to target server
scp -rp $Src/webdeploy/* $Login_Name@$Dest_IP:$Dest

