# /bin/zsh
case ${OSTYPE} in 
        drawin*)
        # macosのとき
        ln -s ./macos/.zshrc $HOME/.zshrc;
        ln -s ./macos/.zsh_profile $HOME/.zsh_profile;
        ln -s ./macos/.zsh_env $HOME/.zsh_env
        ln -s ./macos/alacritty.yml $HOME/.config/alacritty/alacritty.yml;
        ;;
        linux*)
        #linuxのときの処理
        ln -s ./linux/.zshrc $HOME/.zshrc;
        ln -s ./linux/.zsh_profile $HOME/.zsh_profile;
        ln -s ./linux/.zsh_env $HOME/.zsh_env
        ln -s ./linux/alacritty.yml $HOME/.config/alacritty/alacritty.yml;
        source $HOME/.zshrc;
        source $HOME/.zsh_profile;

        ;;
esac