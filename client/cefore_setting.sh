#!/bin/sh

sudo cp /share/cefnetd.conf /usr/local/cefore/cefnetd.conf
sudo cp /share/cefnetd.fib /usr/local/cefore/cefnetd.fib

# sudo sed -i "1iCS_MODE=0" /usr/local/cefore/cefnetd.conf
# sudo sed -i "1iccnx:/BitTorrent udp 192.168.56.10" /usr/local/cefore/cefnetd.fib
