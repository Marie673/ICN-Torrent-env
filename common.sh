#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get full-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean -y

sudo apt-get install -y build-essential
sudo apt-get install -y expect
sudo apt-get install -y cmake python3-pip
sudo apt-get install -y libssl-dev
sudo apt-get install -y git