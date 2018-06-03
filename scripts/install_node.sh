#!/bin/sh
# The script installs node 10.3.0. requires git and postgresql
# thanks to https://github.com/mklement0/n-install

curl -L https://git.io/n-install | bash -s -- -y 10.3.0

sudo bash -c 'cat > $HOME/bash.rc' << EOF
    alias smartcar='n use 10.3.0 $PWD/bin/www'
EOF
npm install sequelize-cli -g 
npm install 