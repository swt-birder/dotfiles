#""""""""""""""""""""""""""""""""""""""""""""""""
#             General                           "
#""""""""""""""""""""""""""""""""""""""""""""""""
# pyenvに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv
# pyenvさんに自動補完機能を提供してもらう
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
#""""""""""""""""""""""""""""""""""""""""""""""""
#             Plugin                            "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# 補完
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting
# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word
#""""""""""""""""""""""""""""""""""""""""""""""""
#             alias                             "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
alias gs='git status'
alias ga='git add .'
alias gct='git commit -m "update: "`date '+%Y-%m-%d-%H:%M:%S'`'
alias gcv='git commit -v'
alias gcm='git checkout master'
alias gph='git push origin HEAD'
alias gpl='git pull'
alias zrc='source ~/.zshrc'
alias vz='vim  ~/dotfiles/zshrc'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -r'
alias vi='vim'
alias mkdir='mkdir -pv'
alias diffy='diff -y --suppress-common-lines'
#""""""""""""""""""""""""""""""""""""""""""""""""
#             Completion                        "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
# 自動補完を有効にする
autoload -Uz compinit ; compinit
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# コマンドミスを修正
setopt correct
# 補完の選択を楽にする
zstyle ':completion:*' menu select
# 補完候補をできるだけ詰めて表示する
setopt list_packed
# 補完候補にファイルの種類も表示する
setopt list_types
export CLICOLOR=1
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 大文字・小文字を区別しない(大文字を入力した場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true
#export LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -GF"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#""""""""""""""""""""""""""""""""""""""""""""""""
#             fzf                               "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_CTRL_R_OPTS='--prompt="History > "'
export FZF_DEFAULT_OPTS='--height 70% --reverse --select-1 --exit-0 --multi --border'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:252,bg:233,hl:#32cd32,fg+:#ee82ee,bg+:235,hl+:#00ff00
--color info:144,prompt:161,spinner:135,pointer:135,marker:118
'
#""""""""""""""""""""""""""""""""""""""""""""""""
#             Prompt                            "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
# %M    ホスト名
# %m    ホスト名
# %d    カレントディレクトリ(フルパス)
# %~    カレントディレクトリ(フルパス2)
# %C    カレントディレクトリ(相対パス)
# %c    カレントディレクトリ(相対パス)
# %n    ユーザ名
# %#    ユーザ種別
# %?    直前のコマンドの戻り値
# %D    日付(yy-mm-dd)
# %W    日付(yy/mm/dd)
# %w    日付(day dd)
# %*    時間(hh:flag_mm:ss)
# %T    時間(hh:mm)
# %t    時間(hh:mm(am/pm))
# PROMPT='%F{cyan}%n@%m%f:%~# '
# vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
#zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='[%n]
%{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
#RPROMPT='${vcs_info_msg_0_}'
#""""""""""""""""""""""""""""""""""""""""""""""""
#             History                           "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
# 基本設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
# ヒストリーに重複を表示しない
setopt histignorealldups
# 他のターミナルとヒストリーを共有
setopt share_history
# すでにhistoryにあるコマンドは残さない
setopt hist_ignore_all_dups
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 履歴をすぐに追加する
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify
export PATH=$PATH:/Users/haysato/.emacs.d/bin
export PATH="$PATH:$HOME/bin"
######################
#  Terminal Support  #
######################
__term_support() {
  # set title
  if [[ -n "$SSH_CONNECTION" ]]; then
    print -Pn "\e]0;%m: %1~\a"
  else
    print -Pn "\e]0;%1~\a"
  fi
}
case "$TERM" in
  xterm*|screen*|tmux*)
    add-zsh-hook precmd __term_support
    ;|
  eterm*|xterm-kitty)
    zstyle ':iterm2:osc' enable false
    ;;
esac
