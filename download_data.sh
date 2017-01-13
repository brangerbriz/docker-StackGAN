#!/bin/bash

function download() {
	# curl follow redirect piped to unzip
	TMPFILE="tmp.zip"
	wget "$1" -O $TMPFILE
	unzip -d $PWD $TMPFILE
	rm $TMPFILE
}

cd StackGAN/Data
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds.zip"
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/flowers.zip"

