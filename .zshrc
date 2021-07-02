
### Added by Zplugin's installer
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

# .zshrc

autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

export LSCOLORS=Exfxcxdxbxegedabagacad
alias ls='ls -G'

alias ghci='stack ghci'
alias ghc='stack ghc --'
alias runghc='stack runghc --'

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting


zinit load zdharma/history-search-multi-word

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure


zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin


zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose


zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zinit light vim/vim


zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras

### History ###
HISTFILE="${XDG_DATA_HOME}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
autoload -Uz add-zsh-hook
add-zsh-hook preexec optimize_history_preexec
add-zsh-hook precmd optimize_history_precmd
optimize_history_preexec() {
    OPTIMIZE_HISTORY_CALLED=1
}
optimize_history_precmd() {
    local -r exit_code="$?"
    # Exit Code 130: Script terminated by Ctrl-C
    if [[ ! ${exit_code} =~ ^(0|130)$ ]] && [[ "${OPTIMIZE_HISTORY_CALLED}" -eq 1 ]]; then
        # BSD || GNU
        command sed -i '' '$d' "${HISTFILE}" 2>/dev/null || command sed -i '$d' "${HISTFILE}"
    fi
    unset OPTIMIZE_HISTORY_CALLED
}

### Alias ###
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias c='clear'
alias sudo='sudo -E '

### Options ###
# Doc: http://zsh.sourceforge.net/Doc/Release/Options.html
# Changing Directories
setopt AUTO_CD
# Completion
setopt ALWAYS_LAST_PROMPT
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt LIST_PACKED
# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
# Input/Output
setopt CORRECT
setopt INTERACTIVE_COMMENTS
# Expansion and Globbing
setopt EXTENDED_GLOB
setopt GLOBDOTS
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT

### Completion ###
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion::complete:*' use-cache true
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"

### cdr ###
# Doc: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Recent-Directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "${XDG_DATA_HOME}/zsh/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-max 100
zstyle ':chpwd:*' recent-dirs-pushd true

### zsh line editor ###
# Doc: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
export KEYTIMEOUT=1
bindkey -v
# like bindkey -e (emacs)
bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^Y' yank
# Change the cursor between 'Line' and 'Block' shape
function zle-keymap-select zle-line-init zle-line-finish {
    case "${KEYMAP}" in
        main|viins)
            printf '\033[6 q' # Line cursor
            ;;
        vicmd)
            printf '\033[2 q' # Block cursor
            ;;
    esac
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


alias yd="yarn dev"
alias yb="yarn build"
alias ya="yarn add"
alias yt="yarn test"
alias ylf="yarn lint-fix"
alias ys="yarn start"
alias y='yarn'
alias yst='yarn storybook'

alias dloraily='python3 safaribooks.py --cred "ysakano@acm.org:e6FSwmryGMf6vrt" '
e6FSwmryGMf6vrt