# 1 Pre-installation
# 2 Installation
# 3 Configure the system
# 4 Reboot
# 5 Post-installation

########################################## Nvidia drivers

# Identify your card
lspci    | grep -i nvidia
lspci    | grep -e VGA -e 3D
lspci -k | grep -A 2 -i "VGA"

# Install drivers and driver's utils
pacman -S nvidia nvidia-utils

# Reboot

######################################## GPU computation

pacman -S cuda   # Nvidia API for GPGPU
pacman -S cudnn  # Nvidia primitives for Neural Networks
Magma            # Linear Algebra for OpenCL and CUDA and heteregenous many-core systems

######################################## Computation

OpenBLAS + LAPACK # Efficient Matrix computation and Linear Algebra library (alternative MKL)
Numpy             # Matrix Manipulation in Python
Scipy             # General scientific library for Python. Sparse matrices support

######################################## Deep larining frameworks

Pytorch
Theano
Tensorflow
Keras
Mxnet
Nervana Neon, Chainer, DyNet, MinPy





######################################## Other packages

# Monitoring
htop       - Monitor CPU, RAM, load, kill programs
nvidia-smi - Monitor Nvidia GPU

CSV manipulation
xsv - The fastest, multi-processing CSV library. Written in Rust.


    
Rapid Development, Research
Jupyter - Code Python, R, Haskell, Julia with direct feedback in your browser
jupyter_contrib_nbextensions - Extensions for jupyter (commenting code, ...)

Visualization
Matplotlib
Seaborn


