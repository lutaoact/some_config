[ -r /etc/bashrc ] && . /etc/bashrc
[ -r ~/script/lutaoact_functions.sh ] && . ~/script/lutaoact_functions.sh

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}")";
}

PS1='\h:\u \W \[\033[1;32m\]$(git_branch)\[\033[0m\]\$ '

alias lsport='lsof -i -P | grep -i listen'
alias redis-cli='redis-cli --raw' #让redis-cli正常显示中文
#alias ls='ls -G' #for BSD ls
alias ls='ls --color=auto' #for GNU ls
#alias ll="ls -alFG" #for BSD ls
alias ll="ls -alF" #for GNU ls
alias grep='grep --color=auto'
alias proxy='/Users/lutao/sshuttle/sshuttle -r aws 0/0 -vv'

#全局可用
alias validate_srt="perl ~/gale/scripts/validate_srt.pl"
alias srt2utf8="sh ~/gale/scripts/srt2utf8.sh"
alias scpyun="sh ~/gale/scripts/scpyun.sh"
alias add_space_suffix="perl ~/gale/scripts/add_space_suffix.pl"

#到gale目录去执行
alias load_kp_for_de="coffee scripts/load_key_point_json_to_db.coffee de"
alias load_kp_for_nceone="coffee scripts/load_key_point_json_to_db.coffee nceone"
alias load_srt_for_de="coffee scripts/load_srt_json_to_db.coffee de"
alias load_srt_for_nceone="coffee scripts/load_srt_json_to_db.coffee nceone"

alias load_lesson_list="sh scripts/load_lesson_list_json_to_db.sh"

alias convert_srt_for_de="perl scripts/convert_srt_to_json.pl de"
alias convert_srt_for_nceone="perl scripts/convert_srt_to_json.pl nceone"
alias convert_kp_for_de="perl scripts/convert_key_point_txt_to_json.pl de"
alias convert_kp_for_nceone="perl scripts/convert_key_point_txt_to_json.pl nceone"
alias output_base_for_de="coffee scripts/output_key_points_base.coffee de"
alias output_base_for_nceone="coffee scripts/output_key_points_base.coffee nceone"
alias convert_lesson_list="perl scripts/convert_lesson_list_to_json.pl"

export TERM=xterm
export PATH="/usr/local/openresty/nginx/sbin:~/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PERL_HASH_SEED=0x00
export PERL_PERTURB_KEYS=0

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
export EDITOR=vim
export HISTSIZE=10000
export HISTCONTROL="ignoredups"
ulimit -S -n 10032

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm # install nvm by curl
alias npm='npm --registry=https://registry.npm.taobao.org'

# DuDu
alias init_mac_dev="sh ~/script/init_mac_dev.sh"
alias sshdd='ssh -t dd tmux a'
alias sync_db="sh ~/script/sync_db_from_dd_test_server.sh"
alias eld='el $(git d --name-only)'
alias elds='el $(git ds --name-only)'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NODE_ENV=development

# Wind
alias mongow='mongo 127.0.0.1:27018/wind-cms-dev'

# DDX
alias redis29='redis-cli -h 192.168.1.29'

# Linux-101-Hacks
export CDPATH=~:/data
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

shopt -s cdspell
