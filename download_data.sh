#!/bin/bash

# Downloads the word embeddings and image datasets to StackGAN/Data.
# Preprocesses the images using misc/preprocess_*.py

function download() {
	# curl follow redirect piped to unzip
	TMPFILE="tmp.zip"
	wget "$1" -O $TMPFILE
	unzip -d $PWD $TMPFILE
	rm $TMPFILE
}

cd StackGAN/Data
echo "Downloading bird embeddings..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds.zip"
echo "Downloading flower embeddings..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/flowers.zip"

cd birds
echo "Downloading bird images..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/CUB_200_2011.zip"

cd ../flowers
echo "Downloading flower images..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/102flowers.zip"

cd ..
echo "Preprocessing bird images..."
python "misc/preprocess_birds.py"
echo "Preprocessing flower images..."
python "misc/preprocess_flowers.py"



