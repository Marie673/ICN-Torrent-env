#!/bin/sh

sudo apt-get install gnome-core -y
sudo service gdm start
sudo apt-get install ubuntu-desktop -y
#sudo apt-get install lxde -y
sudo apt-get install gnome-panel -y
sudo apt-get install gnome-settings-daemon -y
sudo apt-get install metacity -y
sudo apt-get install nautilus -y
sudo apt-get install gnome-terminal -y

sudo apt-get install tightvncserver -y
command="vncserver Password"
# shellcheck disable=SC2034
password="Tsax8729"
expect -c "
  spawn ${command}
  expect {
    \"Password\" {}
  }
  send \"${password}\n\"
  expect {
    \"Verify\" {}
  }
  send \"${password}\n\"
  expect {
    \"view-only\" {}
  }
  send \"n\n\"
  expect "
vncserver -kill :1

cp /share/xstartup.sh .vnc/xstartup.sh
