# /bin/sh
# セットアップスクリプト for linux

# zsh インストール
sudo apt install -y zsh;
chsh -s /usr/bin/zsh;
# git download
sudo apt install -y git;

# cargo install 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;

# rust-analyzeとかの

rustup component add rls rust-analysis rust-src;

# nvmインストール    
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash;
export NVM_DIR="$HOME/.nvm";
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh";

nvm install --lts;
nvm use --lts;

npm install -g firebase-tools;
npm install -g vercel;

sudo apt install -y alacritty;
# zinit download
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)";


# 