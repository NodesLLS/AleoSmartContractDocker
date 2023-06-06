# Используйте базовый образ Ubuntu
FROM ubuntu:latest

# Установка необходимых пакетов
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    screen \
    curl \
    git \
    build-essential

# Установка SnarkOS
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN git clone https://github.com/AleoHQ/snarkOS.git --depth 1 && \
    cd snarkOS && \
    ./build_ubuntu.sh

# Установка языка Leo
RUN cd /root && \
    git clone https://github.com/AleoHQ/leo && \
    cd leo && \
    cargo install --path .

# Копирование приложения
RUN mkdir /root/demo_deploy_Leo_app
WORKDIR /root/demo_deploy_Leo_app
COPY . .

# Определение команды запуска приложения
CMD ["leo"]

