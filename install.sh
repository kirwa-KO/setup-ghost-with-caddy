sudo apt update && sudo apt -y upgrade && sudo apt install -y zsh curl

# Install oh-my-zsh and zsh-autosuggestions
echo Y | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/g' ~/.zshrc
zsh && source ~/.zshrc

# install caddy
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

# install mysql
sudo apt-get install -y mysql-server
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'"

# install nodejs
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash
sudo apt-get install -y nodejs

# install ghost-cli
sudo npm install ghost-cli@latest -g
ghost install


# Caddy config
# blog.kirwako.com

sudo echo "your-domain.com" > reverse_proxy 127.0.0.1:2368
sudo echo "" >> reverse_proxy 127.0.0.1:2368
sudo echo "/etc/caddy/Caddyfile" >> reverse_proxy 127.0.0.1:2368
