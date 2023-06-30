# Use the base Ubuntu image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    screen \
    curl \
    git \
    build-essential \
    dos2unix

# Install SnarkOS
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN git clone https://github.com/AleoHQ/snarkOS.git --depth 1 && \
    cd snarkOS && \
    ./build_ubuntu.sh && \
    cargo install --path .

# Install Leo language
RUN cd /root && \
    git clone https://github.com/AleoHQ/leo && \
    cd leo && \
    cargo install --path .

# Copy the deployment script into the image
COPY deploy_app.sh /root/deploy_app.sh

# Set permissions to execute the script
RUN chmod +x /root/deploy_app.sh

# Define the container's startup command
CMD ["tail", "-f", "/dev/null"]

