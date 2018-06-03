#!/bin/sh
# The script requires n and git
# Usage: If Cloud9User and Cloud9PWD are given, it installs cloud 9.
# thanks to https://github.com/mklement0/n-install


Cloud9User="${1}"
Cloud9PWD="${2}"

# install node for cloud9 6.14.2
n 6.14.2
cd $HOME
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh
n 10.3.0

# Populate `~/bash.rc`
sudo bash -c 'cat > $HOME/bash.rc' << EOF
    alias cloud9='n use 6.14.2 $HOME/c9sdk/server -l 0.0.0.0 -a {$Cloud9User}:{$Cloud9PWD} -w $PWD'
EOF