#!/bin/sh

PostgresUser="${1}"
PostgresPWD="${2}"

AP_SSID="${3}"
AP_PASSPHRASE="${4}"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo ./install_postgressql $PostgresUser $PostgresPWD
sudo ./install_node.sh
sudo ./setup_ap+wifi.sh $AP_SSID $AP_PASSPHRASE
