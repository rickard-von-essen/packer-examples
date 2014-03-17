#!/bin/bash -

set -o nounset

prlctl delete packer-parallels-iso
rm -rf output-parallels-iso 1_iso_debug.log

export PACKER_LOG=true
export PACKER_LOG_PATH=./1_iso_debug.log

export PATH=$GOPATH/bin:$PATH
echo "Using: `which packer`"
echo "Using: `which builder-parallels-iso`"
echo "Using: `which builder-parallels-pvm`"

packer build -only=parallels-iso -var-file=secrets.json -var-file=centos-6.5.json template-el-6.5.json
