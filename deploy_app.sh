#!/bin/bash

# Ввод данных от пользователя
read -p "Введите адрес Aleo: " WALLETADDRESS
read -p "Введите приватный ключ Aleo: " PRIVATEKEY
read -p "Введите код записи (Record): " RECORD

# Генерируем название приложения
APPNAME="helloworld_${WALLETADDRESS:4:6}"
echo $APPNAME

# Создаем новое приложение
leo new "$APPNAME"

# Запускаем приложение
cd "$APPNAME" && leo run && cd -

# Получаем путь к приложению
PATHTOAPP=$(realpath -q "$APPNAME")
echo $PATHTOAPP
cd "$PATHTOAPP" && cd -

# Разворачиваем приложение
snarkos developer deploy "${APPNAME}.aleo" --private-key "$PRIVATEKEY" --query "$RECORD"
