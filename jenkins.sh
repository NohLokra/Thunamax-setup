# apt-get -y update
# apt-get install -y default-jdk
# wget http://pkg.jenkins-ci.org/debian-rc/binary/jenkins_2.0_all.deb
# dpkg -i jenkins*
# apt-get -f install
# /etc/init.d/jenkins start

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install -y jenkins
password=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
curl --data "j_password=$password&from=/" http://localhost:8080/j_acegi_security_check
