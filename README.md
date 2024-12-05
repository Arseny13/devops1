# devops1
1. Создать докер образ:
  - базовый образ -- ubuntu:20.04
  - создать пользователей john, alan, steve, mia
    - у каждого должна быть домашняя директория
    - только john и steve должны быть с паролями
    - у mia -- shell fish, у alan -- zsh, у остальных bash
  - cоздать группы senior, middle, junior
  - добавить john в группу senior, alan steve -- middle, mia - junior
  - установить helm, kubectl
  - выдать права на запуск этих утилит всем пользователям в группе senior, middle
  - установить следующие утлиты (почитать как правильно работать с кешом apt в докер контейнерах):
      - git
      - wget
      - curl
      - gcc
  - скопировать файлы с локального пк в докер образ
  - прокинуть ssh сокет внутрь docker образа для доступа к узлам и git репозиториям # хз


2. Создать докер образ с postgresql:14
  В Dockerfile:
  - создать пользователя
  Запустить образ и подлкючиться к базе с локального пк



# install 

1. 
```
sudo apt install curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh  
sudo apt update 
sudo apt install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common -y 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
```
2. 
```
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install docker-ce docker-compose -y 
```
3. ```sudo systemctl status docker ```

# Run
docker build -t test .  
docker run -it test

docker run -it --rm \
    -v $SSH_AUTH_SOCK:/ssh-agent \
    -e SSH_AUTH_SOCK=/ssh-agent \
    test