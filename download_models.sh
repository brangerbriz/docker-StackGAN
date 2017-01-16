#!/bin/bash

function download() {
	# curl follow redirect piped to unzip
	wget "$1"
}

cd StackGAN/models
echo "Downloading pretrained birds model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds_model_164000.ckpt"
echo "Downloading pretrained flowers model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/flowers_model_130000.ckpt"
echo "Downloading pretrained birds skip thought model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/birds_skip_thought_model_164000.ckpt"

mkdir -p text_encoder
cd text_encoder
echo "Downloading text encoder for birds model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/lm_sje_nc4_cub_hybrid_gru18_a1_c512_0.00070_1_10_trainvalids.txt_iter30000.t7"
echo "Downloading text encoder for flowers model..."
download "https://github.com/brangerbriz/docker-StackGAN/releases/download/datasets/lm_sje_flowers_c10_hybrid_0.00070_1_10_trainvalids.txt_iter16400.t7"