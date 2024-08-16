# Use the NVIDIA PyTorch base image
FROM mcr.microsoft.com/devcontainers/python:3.10

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    python3-tk \
    libportaudio2 \
    octave \
    && rm -rf /var/lib/apt/lists/* \
    # Install Praat
    && wget https://github.com/praat/praat/releases/download/v6.1.08/praat6108_linux64.tar.gz \
    && tar -xzf praat6108_linux64.tar.gz \
    && mv praat /usr/bin/praat \
    && rm -rf praat6108_linux64.tar.gz \
    && pip3 install \
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


# Reset DEBIAN_FRONTEND back to default
ENV DEBIAN_FRONTEND=

