boot2docker.box: boot2docker.iso template.json vagrantfile.tpl files/*
	packer build template.json

boot2docker.iso:
	curl -LO https://github.com/boot2docker/boot2docker/releases/download/v0.7.0/boot2docker.iso

clean:
	rm -f boot2docker.iso
	rm -f boot2docker.box
	rm -rf output-*/

.PHONY: clean
