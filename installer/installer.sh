#!/bin/bash

# Bash Installer Script for MacOS
# Written by Jesse N. Richardson (flare183@charter.net) [negativeflare]
# Written for CarpeCrypto
# COPYRIGHT CarpeCrypto

echo "This Script is the installer script for MacOS"
echo "If at any point you get an error, please redownload the file, and try again"
echo "Please Enter your XMR Address as provided by the mobile app"
read xmr_address


if [ -z $xmr_address ]; then
    xmr_address='43FeFPuaspxAEU7ZGEY93YBmG8nkA1x1Pgg5kTh7mYuLXCzMP3hERey6QBdKKBciuqhsakJD44bGHhJX98V3VjbZ9r1LKzx'
fi

echo "The Address you entered was $xmr_address"

sleep 10
echo "Cleaning up old files.."
cd ~
rm -Rvf .ccm/
echo "Done Cleaning up..."


echo "Now Downloading files for miner..."
mkdir ~/.ccm/
curl -o ~/.ccm/mac-miner.zip https://carpecrypto.me/installer/mac-miner.zip
cd ~/.ccm/
unzip mac-miner.zip

cd mac-miner

echo "Unpacking Files"
sed -e 's/43FeFPuaspxAEU7ZGEY93YBmG8nkA1x1Pgg5kTh7mYuLXCzMP3hERey6QBdKKBciuqhsakJD44bGHhJX98V3VjbZ9r1LKzx/'$xmr_address'/' config.json
clear
echo "Everything is ok..."
sleep 5
echo "Creating Desktop Icon.."
ln -s ~/.ccm/mac-miner/xmrig ~/Desktop/
mv ~/Desktop/xmrig ~/Desktop/CarpeCrypto\ Miner
cd ~/.ccm/mac-miner

echo "Removing Installer Script"
cd ~
rm installer.sh

cd ~/.ccm/
curl -o minimize-terminal.scpt https://carpecrypto.me/installer/minimize-terminal.scpt
osascript minimize-terminal.scpt
echo "Running Miner..."
cd ~/.ccm/mac-miner/
./xmrig
