#!/bin/bash

# Install Python packages
pip3 install \
    dtw==1.4.0 \
    matplotlib \
    numpy \
    python-speech-features \
    scipy \
    scikit-learn \
    sounddevice \
    oct2py \
    tqdm \
    fastdtw

# Set up VocalTractLab
mkdir -p libs
cd libs
wget http://vocaltractlab.de/download-vocaltractlabapi/VTL2.1_Linux.zip
wget http://vocaltractlab.de/download-vocaltractlabapi/vtlapi-2.1b.zip
unzip VTL2.1_Linux.zip -d VTL2.1_Linux
unzip vtlapi-2.1b.zip -d vtlapi-2.1b
cd ..


# Set up GBFB features
cd libs
git clone https://github.com/m-r-s/reference-feature-extraction
cd ..

# Set up environment variable for Praat
echo 'export PRAAT_CMD=/usr/bin/praat' >> ~/.bashrc
source ~/.bashrc

echo "Setup complete."