# misc shell features
bindkey -e
autoload -U compinit && compinit

# aliases
alias reload='exec zsh'

# env variables
export GPG_TTY=$(tty)

. "${DF2_DIR}/zshrc.50.PS1"
. "${DF2_DIR}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
. "${DF2_DIR}/history-search-multi-word/history-search-multi-word.plugin.zsh"

