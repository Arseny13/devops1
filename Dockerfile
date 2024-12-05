# Используем базовый образ Ubuntu 20.04
FROM ubuntu:20.04

# Обновляем пакеты и устанавливаем необходимые утилиты
RUN apt-get update && apt-get install -y \
    nano \
    sudo \
    curl \
    lsb-release \
    gnupg2 \
    wget \
    apt-transport-https \
    zsh \
    fish \
    bash \
    acl \
    git \
    gcc \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Создаем группы
RUN groupadd senior && groupadd middle && groupadd junior

# Создаем пользователей с домашними директориями
RUN useradd -m -s /bin/bash john && echo "john:password" | chpasswd \
    && useradd -m -s /bin/bash steve && echo "steve:password" | chpasswd \
    && useradd -m -s /bin/zsh alan \
    && useradd -m -s /usr/bin/fish mia

# Устанавливаем Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh \
&& ./get_helm.sh

RUN if [ -f /usr/local/bin/helm ]; then \
        echo "Helm установлен"; \
    else \
        echo "Helm не найден"; exit 1; \
    fi

# Устанавливаем kubectl
RUN curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl

# Добавляем пользователей в соответствующие группы
RUN usermod -aG senior john \
    && usermod -aG middle alan \
    && usermod -aG middle steve \
    && usermod -aG junior mia

# Выдаем права на запуск helm и kubectl для пользователей из групп senior и middle
RUN chmod +x /usr/local/bin/helm /usr/local/bin/kubectl \
    && setfacl -m g:senior:rx /usr/local/bin/helm /usr/local/bin/kubectl \
    && setfacl -m g:middle:rx /usr/local/bin/helm /usr/local/bin/kubectl


# Копирвоание файла
COPY ./test.txt .

# Cоздание папки для сокета
RUN mkdir -p /ssh-agent

# Запускаем bash по умолчанию
CMD ["/bin/bash"]