# Doc: http://zsh.sourceforge.net/Doc/Release/Files.html
export ZDOTDIR="${HOME}/.config/zsh"
. "${ZDOTDIR}/.zshenv"
export XDG_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"${HOME}/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"${HOME}/.cache"}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-"/tmp/runtime-$(id -u)"}"
if [[ ! -d "${XDG_RUNTIME_DIR}" ]]; then
    command mkdir -m 700 -p -- "${XDG_RUNTIME_DIR}"
fi
export PATH="${PATH}:${HOME}/flutter/flutter/bin"