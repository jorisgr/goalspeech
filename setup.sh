#!/bin/bash

# # Install Python packages ## Moved to Dockerfile
# pip3 install \
#     dtw==1.4.0 \
#     matplotlib \
#     numpy \
#     python-speech-features \
#     scipy \
#     scikit-learn \
#     sounddevice \
#     oct2py \
#     tqdm \
#     fastdtw

mkdir -p libs

# Set up VocalTractLab
if [ ! -d "libs/VTL2.1_Linux" ]; then
    cd libs
    wget http://vocaltractlab.de/download-vocaltractlabapi/VTL2.1_Linux.zip
    unzip -o VTL2.1_Linux.zip -d VTL2.1_Linux
    rm VTL2.1_Linux.zip
    cd ..
fi

if [ ! -d "libs/vtlapi-2.1b" ]; then
    cd libs
    wget http://vocaltractlab.de/download-vocaltractlabapi/vtlapi-2.1b.zip
    unzip -o vtlapi-2.1b.zip -d vtlapi-2.1b
    rm vtlapi-2.1b.zip
    cd ..
fi

# Set up GBFB features
if [ ! -d "libs/reference-feature-extraction" ]; then
   cd libs
    git clone https://github.com/m-r-s/reference-feature-extraction
    cd ..
fi

# Set up environment variable for Praat
echo 'export PRAAT_CMD=/usr/bin/praat' >> ~/.bashrc

# set up XDG_RUNTIME_DIR
sudo mkdir /run/user/$UID
sudo chown -R $USER:$USER /run/user/$UID
echo "export XDG_RUNTIME_DIR=/run/user/$UID" >> ~/.bashrc

# Increase node.js memory limit for remote configuration to prevent PyLance 
# from crashing according to 
# https://github.com/microsoft/pylance-release/blob/main/TROUBLESHOOTING.md#pylance-is-crashing
echo 'export NODE_OPTIONS="--max-old-space-size=8192"' >> ~/.bashrc


source ~/.bashrc

echo "Setup complete."