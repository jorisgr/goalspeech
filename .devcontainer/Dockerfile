# Use the NVIDIA PyTorch base image
FROM nvcr.io/nvidia/pytorch:23.07-py3

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Arguments for user creation
ARG USERNAME
ARG USER_UID
ARG USER_GID

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    # sudo \
    python3-tk \
    libportaudio2 \
    # # installing octave through apt seems to break pytorch
    # octave \
    && rm -rf /var/lib/apt/lists/* \


# Create a non-root user with sudo access
# Add the user to sudoers
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

#
# Install Praat
RUN wget https://github.com/praat/praat/releases/download/v6.1.08/praat6108_linux64.tar.gz \
    && tar -xzf praat6108_linux64.tar.gz \
    && mv praat /usr/bin/praat \
    && rm -rf praat6108_linux64.tar.gz

# Reset DEBIAN_FRONTEND back to default
ENV DEBIAN_FRONTEND=

# # Switch to the non-root user
# USER $USERNAME
