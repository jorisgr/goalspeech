# Use the NVIDIA PyTorch base image
FROM nvcr.io/nvidia/pytorch:23.07-py3

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Create a non-root user and switch to it
RUN useradd -ms /bin/bash vscode

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    python3-tk \
    libportaudio2 \
    octave \
    && rm -rf /var/lib/apt/lists/*

# Add the user to sudoers
RUN echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Praat
RUN wget https://github.com/praat/praat/releases/download/v6.1.08/praat6108_linux64.tar.gz \
    && tar -xzf praat6108_linux64.tar.gz \
    && mv praat /usr/bin/praat \
    && rm -rf praat6108_linux64.tar.gz

# Reset DEBIAN_FRONTEND back to default
ENV DEBIAN_FRONTEND=
