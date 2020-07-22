#""""""""""""""""""""""""""""""""""""""""""""""""
#             alias                             "
#""""""""""""""""""""""""""""""""""""""""""""""""
alias gs='git status'
alias ga='git add .'
alias gct='git commit -m "update: "`date '+%Y-%m-%d-%H:%M:%S'`'
alias gcm='git checkout master'
alias gph='git push origin HEAD'
alias gpl='git pull'
alias zrc='source ~/.zshrc'
alias vz='vim  ~/.zshrc'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -r'
alias vi='vim'
alias mkdir='mkdir -pv'
alias diffy='diff -y --suppress-common-lines'

setopt no_beep
#""""""""""""""""""""""""""""""""""""""""""""""""
#             fzf                               "
#""""""""""""""""""""""""""""""""""""""""""""""""
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_R_OPTS='--prompt="History > "'
export FZF_DEFAULT_OPTS='--height 70% --reverse --select-1 --exit-0 --multi --border'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:252,bg:233,hl:#32cd32,fg+:#ee82ee,bg+:235,hl+:#00ff00
--color info:144,prompt:161,spinner:135,pointer:135,marker:118
'
