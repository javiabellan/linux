#################################### Partitions

Note that the 240GB of SSD drive is being separated to 3 parts:

	4 GB for swap
	80 GB mounted as /storage to store persistent data
	The rest mounted as / to install Ubuntu


#################################### Update system

sudo apt-get update
sudo apt-get upgrade


#################################### Install utils

# developer tools
sudo apt-get install -y build-essential cmake g++ gfortran git make  
sudo apt-get install -y pkg-config software-properties-common vim wget
sudo apt-get autoremove
sudo rm -rf /var/lib/apt/lists/*


#################################### Nvidia drivers

# Find your graphics card model
lspci | grep -i nvidia

sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update

# check
cat /proc/driver/nvidia/version

#################################### CUDA

sudo dpkg -i cuda-repo-ubuntu1604–9–1-local_9.1.85–1_amd64.deb
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

# Add to .profile
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# check
nvcc -V
nvidia-smi

#################################### cuDNN

tar xvf cudnn-8.0-linux-x64-v6.0.tgz
sudo cp -P cuda/lib64/* /usr/local/cuda/lib64/
sudo cp cuda/include/* /usr/local/cuda/include/

echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH="/usr/local/cuda/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc


#################################### Dependencies

# Deep larning framworks dependencies
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler libopencv-dev

# Important packages like boost, lmdb, glog, blas etc
sudo apt-get install -y --no-install-recommends libboost-all-dev doxygen
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev libblas-dev 
sudo apt-get install -y libatlas-base-dev libopenblas-dev libgphoto2-dev libeigen3-dev libhdf5-dev 

# Python 2 and 3
sudo apt-get install -y python-dev  python-pip  python-nose  python-numpy  python-scipy python-setuptools
sudo apt-get install -y python3-dev python3-pip python3-nose python3-numpy python3-scipy

# Image and video I/O
sudo apt-get install -y liblapack-dev
						libjpeg62-dev
						libfreetype6
						libfreetype6-dev
						libjpe

#################################### Anaconda

# Go to https://www.anaconda.com/download/#linux
wget https://repo.anaconda.com/archive/Anaconda3-5.1.0-Linux-x86_64.sh

bash Anaconda3–5.1.0-Linux-x86_64.sh

source ~/.bashrc

# check
conda list

#################################### Virtual envirorment [optional]

# Create
conda create --name env python=3

# Get in
source activate env

# Get out
source deactivate

################################### Conda installs

conda install jupyter
conda install theano pygpu
conda install -c anaconda tensorflow-gpu
conda install pytorch torchvision cuda91 -c pytorch


################################### Pip installs

pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython protobuf jupyter

pip3 install tensorflow-gpu  
pip3 install Theano 
pip3 install keras

# pytorch
pip3 install torch
pip3 install http://download.pytorch.org/whl/cu91/torch-0.4.0-cp36-cp36m-linux_x86_64.whl 
pip3 install torchvision

pip3 install dlib

python
import numpy
numpy.__version__
import theano
theano.__version__
import tensorflow
tensorflow.__version__
import keras
keras.__version__
import torch
torch.__version__
import cv2
cv2.__version__

#################################### OpenCV 3.3

sudo apt-get remove x264 libx264-dev
sudo apt-get install -y checkinstall yasm
sudo apt-get install -y libjpeg8-dev libjasper-dev libpng12-dev
 
# If you are using Ubuntu 14.04
sudo apt-get install -y libtiff4-dev
 
# If you are using Ubuntu 16.04
sudo apt-get install -y libtiff5-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
 
sudo apt-get install -y libxine2-dev libv4l-dev
sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install -y libqt4-dev libgtk2.0-dev libtbb-dev
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libvorbis-dev libxvidcore-dev
sudo apt-get install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils

#################################### dlib 19.9

#################################### TensorFlow 1.5

#################################### Keras 2
