FROM tensorflow/tensorflow:0.11.0-gpu
MAINTAINER Brannon Dorsey <brannon@brannondorsey.com>

WORKDIR /
RUN apt-get update
RUN apt-get install -y git

# Clone StackGAN
RUN git clone https://github.com/hanzhanggit/StackGAN.git
ENV PYTHONPATH /StackGAN

# Install StackGAN dependencies
RUN pip install prettytensor progressbar python-dateutil easydict pandas torchfile

# Install optional StackGAN dependencies -----------------------------------------

# Install Torch
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
WORKDIR /root/torch
RUN /bin/bash install-deps
RUN ./install.sh 
# above may need yes

WORKDIR /StackGAN


CMD echo "container started"