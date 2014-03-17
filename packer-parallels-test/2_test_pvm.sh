#!/bin/bash -

set -o nounset

prlctl delete packer-parallels-pvm
rm -rf output-parallels-pvm 2_pvm_debug.log

export PACKER_LOG=true
export PACKER_LOG_PATH=./2_pvm_debug.log

export PATH=$GOPATH/bin:$PATH
echo "Using: `which packer`"
echo "Using: `which builder-parallels-iso`"
echo "Using: `which builder-parallels-pvm`"

packer build -only=parallels-pvm -var-file=secrets.json dev-tools.json
