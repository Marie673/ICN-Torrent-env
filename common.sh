#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get full-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get autoclean

sudo apt-get install -y build-essential
sudo apt-get install libssl-dev
sudo apt-get install -y git