#!/bin/bash

# Bash Installer Script for MacOS
# Written by Jesse N. Richardson (flare183@charter.net) [negativeflare]
# Written for CarpeCrypto
# COPYRIGHT CarpeCrypto

echo "This Script is the installer script for MacOS"
echo "If at any point you get an error, please redownload the file, and try again"
echo "Please Enter your XMR Address as provided by the mobile app"
read xmr_address

echo "The Address you entered was $xmr_address"

echo "Now Downloading files for miner..."
mkdir ~/.ccm/
curl -o ~/.ccm/mac-miner.zip http://carpecrypto.me/installer/mac-miner.zip
cd ~/.ccm/
unzip mac-miner.zip


sleep 20
cd mac-miner

echo "Unpacking Files"
cd mac-miner
sed -e 's/43FeFPuaspxAEU7ZGEY93YBmG8nkA1x1Pgg5kTh7mYuLXCzMP3hERey6QBdKKBciuqhsakJD44bGHhJX98V3VjbZ9r1LKzx/'$xmr_address'/' config.json
clear
echo "Everything is ok..."
sleep 5
echo "Creating Desktop Icon.."
ln -s ~/.ccm/mac-miner/xmrig ~/Desktop/
mv ~/Desktop/xmrig ~/Desktop/CarpeCrypto\ Miner
#ln -s ~/Programming/carpecrypto/mac_installer/xmrig ~/Desktop/xmrig
#mv ~/Desktop/xmrig ~/Desktop/CarpeCrypto\ Miner
cd ~/.ccm/mac-miner
#cd ~/Programming/carpecrypto/mac_installer/

echo "Running Miner..."
./xmrig
