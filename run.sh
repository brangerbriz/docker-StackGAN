#!/bin/bash
mkdir -p StackGAN
nvidia-docker run -it -v StackGAN:/root/StackGAN brannondorsey/docker-stackgan bash
