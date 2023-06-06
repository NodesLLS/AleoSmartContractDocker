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

# Копирование скрипта внутрь образа
COPY deploy_app.sh /root/deploy_app.sh

# Задание прав на выполнение скрипта
RUN chmod +x /root/deploy_app.sh

# Определение команды запуска контейнера
CMD ["tail", "-f", "/dev/null"]

