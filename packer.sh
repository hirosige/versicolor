#!/usr/bin/env bash
#
set -e

if [ -e ~/.vagrant.d/boxes/CentOS6.4-x86-64-minimal/virtualbox ]; then
    rm -rf ~/.vagrant.d/boxes/CentOS6.4-x86-64-minimal/virtualbox
    echo "boxes deleted"
fi

packer build -only=virtualbox packer.json
