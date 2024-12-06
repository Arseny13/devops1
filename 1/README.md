
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


## Run
# [ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux) 

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Check ssh soket
echo $SSH_AUTH_SOCK


docker buildx build --ssh default=$SSH_AUTH_SOCK . -t test
docker run -it test