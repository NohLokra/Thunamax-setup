# On installe nvm pour récupérer npm et node
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# On installe node 6.9.5
nvm install 6.9.5

cd /vagrant/src

# Dépendances
npm install
npm install -g codeceptjs
npm install -g grunt
npm install -g grunt-cli
npm install -g bower

# Dépendances avec bower
echo '{ "allow_root": true }' > /root/.bowerrc

bower install

# Compilation du dossier dist qui sera servi en frontend
grunt

cp ../production/thunamax.conf /etc/apache2/sites-available
a2ensite thunamax.conf
a2dissite 000-default

service apache2 reload
