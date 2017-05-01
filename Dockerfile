FROM tensorflow/tensorflow:0.12.1-gpu
MAINTAINER Brannon Dorsey <brannon@brannondorsey.com>

WORKDIR /root
RUN apt-get update
RUN apt-get install -y git wget ttf-freefont

ENV PYTHONPATH /root/StackGAN

# Install StackGAN dependencies
RUN pip install prettytensor==0.7.3 progressbar python-dateutil \
    easydict pandas torchfile pillow pyyaml ipdb

# copy local files to image 
COPY download_data.sh /root/
COPY download_models.sh /root/
COPY install_torch.sh /root/
COPY append_bashrc /root/

RUN cat /root/append_bashrc >> /root/.bashrc
RUN rm /root/append_bashrc
