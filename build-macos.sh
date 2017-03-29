#!/usr/bin/env bash

mkdir build.standalone
cd build.standalone

printf "\e[91m# create virtualenv\e[0m\n"
virtualenv -p python3.5 venv && source venv/bin/activate

printf "\e[91m# clone webrecorder@develop\e[0m\n"
git clone https://github.com/webrecorder/webrecorder.git
cd webrecorder
git fetch
git checkout origin/develop

printf "\e[91m# build\e[0m\n"
cd webrecorder
pip install Jinja2==2.8 # latest Jinja breaks Pyinstaller!
python setup.py install
./webrecorder/standalone/build_player.sh
cp webrecorder/standalone/dist/webrecorder_player ../../../python-binaries/webrecorder
# cd ../../
# rm -fr build.standalone
