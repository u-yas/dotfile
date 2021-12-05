export PATH=~/.npm-global/bin:$PATH

eval "$(goenv init -)"eval "$(/opt/homebrew/bin/brew shellenv)"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
