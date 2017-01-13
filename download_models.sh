#!/bin/bash

function download() {
	# curl follow redirect piped to unzip
	wget "$1" 
}

cd StackGAN/models
echo "Downloading birds model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds_model_164000.ckpt"
echo "Downloading flowers model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/flowers_model_130000.ckpt"
echo "Downloading birds skip thought model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds_skip_thought_model_164000.ckpt"

