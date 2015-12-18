#!/bin/bash
apt-get install texlive-binaries -y
apt-get install update
wget -O /usr/local/bin/weave https://github.com/zettio/weave/releases/download/latest_release/weave
chmod a+x /usr/local/bin/weave
