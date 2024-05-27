# Use the NVIDIA PyTorch base image
FROM nvcr.io/nvidia/pytorch:23.07-py3

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    python3-tk \
    libportaudio2 \
    octave \
    && rm -rf /var/lib/apt/lists/*

# Install Praat
RUN wget https://www.fon.hum.uva.nl/praat/praat6108_linux64.tar.gz \
    && tar -xzf praat6108_linux64.tar.gz \
    && mv praat_linux64/praat /usr/bin/praat \
    && rm -rf praat_linux64 praat6108_linux64.tar.gz

# Reset DEBIAN_FRONTEND back to default
ENV DEBIAN_FRONTEND=
