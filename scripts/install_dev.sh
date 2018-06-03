#!/bin/sh
# The script requires n and git. it installs cloud 9 and sets git.
# thanks to https://github.com/mklement0/n-install


GitUser="${1}"
GitUser="${2}"
GitName="${3}"
git config --global user.email "$GitUser"
git config --global user.password "$GitPWD!"
git config --global user.name "$GitName"
# install node for cloud9 6.14.2
n 6.14.2
cd $HOME
git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh
n 10.3.0

# Populate `~/bash.rc`
sudo bash -c 'cat > $HOME/bash.rc' << EOF
    alias cloud9='n use 6.14.2 $HOME/c9sdk/server -l 0.0.0.0 -a {$GitUser}:{$GitPWD} -w $PWD'
EOF