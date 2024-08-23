# Use the NVIDIA PyTorch base image
FROM nvcr.io/nvidia/pytorch:21.02-py3

# FROM mcr.microsoft.com/devcontainers/python:3.10

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.

# ARG USERNAME=vscode
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    python3-tk \
    libportaudio2 \
    octave \
    # sudo \
    # 2 libraries needed for praat
    libpulse-dev \
    libgtk2.0-dev \
    && rm -rf /var/lib/apt/lists/* \
    # Install Praat
    && wget https://github.com/praat/praat/releases/download/v6.1.08/praat6108_linux64.tar.gz \
    && tar -xzf praat6108_linux64.tar.gz \
    && mv praat /usr/bin/praat \
    && rm -rf praat6108_linux64.tar.gz \
    # # Continuing from above to add non-root user "vscode" with sudo rights
    # && groupadd --gid $USER_GID $USERNAME \
    # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    # && chmod 0440 /etc/sudoers.d/$USERNAME \
    # # Install Python dependencies
    && conda install  matplotlib numpy scipy scikit-learn tqdm \
    && pip3 install \
        dtw==1.4.0 \
    #     matplotlib \
    #     numpy \
        python-speech-features \
    #     scipy \
    #     scikit-learn \
        sounddevice \
        oct2py \
    #     tqdm \
        fastdtw


# Reset DEBIAN_FRONTEND back to default
ENV DEBIAN_FRONTEND=

