#!/bin/bash

git clone https://github.com/torch/distro.git /root/torch --recursive
cd /root/torch
./install-deps && ./install.sh
source ~/.bashrc