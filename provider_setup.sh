#!/bin/sh

mkdir data
cd data || exit; sudo dd bs=1MB count=128 if=/dev/zero of=124MB.dummy
cd data || exit; sudo dd bs=1MB count=256 if=/dev/zero of=256MB.dummy
cd data || exit; sudo dd bs=1MB count=512 if=/dev/zero of=512MB.dummy
cd data || exit; sudo dd bs=1MB count=1024 if=/dev/zero of=1024MB.dummy
cd data || exit; sudo dd bs=1MB count=2048 if=/dev/zero of=2048MB.dummy

sudo apt-get install -y qbittorrent