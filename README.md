# StackGAN Docker Image
Dockerized version of the wonderful [StackGAN implementation code](https://github.com/hanzhanggit/StackGAN). Check out the [ArXiv paper](https://arxiv.org/abs/1612.03242) if you haven't seen it. Seriously one of the most impressive GANs I've seen in the past year.

## Running the Container

This container was built using the Tensorflow 12.1 GPU image and works with Nvidia-docker. The only requirement is that you have Nvidia-docker and the appropriate Nvidia drivers installed on your machine. If you would like to try and run this container in a CPU-only environment see the section at the bottom of this README.

Pull and run the container with the following commands:

```bash
# create an empy StackGAN/ folder that will be mounted/shared with the container and 
# populated with the StackGAN github repo contents.
mkdir -p StackGAN 
# pull and run the docker image
nvidia-docker run -it -v "$PWD/StackGAN:/root/StackGAN" brannondorsey/docker-stackgan bash 
```

Upon your first login, which should occur immediately if you ran the above command, hanzhanggit/StackGAN will be cloned to `/root/StackGAN` which has been shared with your host machine in the `StackGAN` folder located in the directory that you ran the above command from. This will allow you to easily access any files you generate inside the docker container from your host machine.

__Note__: Because the `root` docker user created these files, these files will likely be owned by `root` on your host machine. You can easily transfer ownership to your user by running the following on the StackGAN/ directory from your host machine:

```
sudo chown -R $USER:$USER StackGAN/
```

## Optional Installs/Downloads

This container comes with the required apt and pip dependencies as well as the cloned StackGAN repos only. To actually use the example code or train the GANs using your own data you must install Torch and download the data and pre-trained models. I've provided three scripts inside of `/root` to easily do this.

```
# Download and build Torch from source, this can take a while
./install_torch.sh

# Download the example birds and flower data used in the paper
# This script also pre-processes the image files using StackGAN/misc/preprocess_*.py
# WARNING: This downloads ~2.3GB of files
./download_data.sh

# Download the pre-trained models and text encoders
# WARNING: This downloads ~3.7GB of files
./download_models.sh
```
