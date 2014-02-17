#! /usr/bin/env bash
#
# PedalPortland Capstone Project (c)
#
# Simple Bash Provisioning Script

# check if required permissions exist before continuing
if [[ $UID -ne 0 ]]; then
    echo "$0 must be run as root"
    exit 1
fi
        
# update machine before installing required applications
apt-get update
apt-get upgrade -y
apt-get install -y python-dev python-pip byobu

pip install flask
