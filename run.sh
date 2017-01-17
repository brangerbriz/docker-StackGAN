#!/bin/bash
mkdir -p StackGAN
nvidia-docker run -it -v "$PWD/StackGAN:/root/StackGAN" brannondorsey/docker-stackgan bash
