#""""""""""""""""""""""""""""""""""""""""""""""""
#             Plugin                            "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
# zplugが無ければインストール
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
# zplugを有効化する
source ~/.zplug/init.zsh
# プラグインList
# zplug "ユーザー名/リポジトリ名", タグ
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# インストールしていないプラグインをインストール
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi
# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

#""""""""""""""""""""""""""""""""""""""""""""""""
#             alias                             "
#""""""""""""""""""""""""""""""""""""""""""""""""
#
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
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
precmd() { vcs_info }
PROMPT='[%n]${vcs_info_msg_0_}
%{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'

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

