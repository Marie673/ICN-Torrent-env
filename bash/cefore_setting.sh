#!/bin/sh

sudo cp /share/cefnetd.conf /usr/local/cefore/cefnetd.conf
sudo cp /share/cefnetd.fib /usr/local/cefore/cefnetd.fib
sudo cp /share/csmgrd.conf /usr/local/cefore/csmgrd.conf

# sudo sed -i "1iCS_MODE=2" /usr/local/cefore/cefnetd.conf
# sudo sed -i "1iCACHE_TYPE=memory\nCACHE_ALGORITHM=libcsmgrd_fifo" /usr/local/cefore/csmgrd.conf