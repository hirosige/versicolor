#!/usr/bin/env bash
#
set -e

if [ -e ~/.vagrant.d/boxes/virtualbox/CentOS6.4-x86-64-minimal ]; then
    rm -rf ~/.vagrant.d/boxes/virtualbox/CentOS6.4-x86-64-minimal
    echo "boxes deleted"
fi

packer build -only=virtualbox packer.json
