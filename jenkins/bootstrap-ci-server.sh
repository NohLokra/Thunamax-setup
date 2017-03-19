apt-get update && apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    ansible

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker \
  docker-ce

docker build -t jenkins /vagrant/jenkins

# Le port 8080 de la VM redirigera vers le port 8080 du container
docker run --name="jenkins" -d -p 49001:8080 -v $PWD/jenkins:/var/jenkins_home:z -t jenkins
