# install yarn on Ubuntu 18.04
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

# nodejs
# nodejs 12.x installed by downloading binary and synmlinking in the /usr/bin directory
