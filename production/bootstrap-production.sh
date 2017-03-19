apt-get update && apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

#Installation de docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

dpkg --configure -a

apt-get update
apt-get install -y docker \
  docker-ce

ls /vagrant

docker pull debian:jessie
docker build -t thunamax:latest /vagrant/production/
# Le port 8080 de la VM redirigera vers le port 8080 du container
docker run --name="thunamax" -d -p 8080:80 thunamax
