[ -r /etc/bashrc ] && . /etc/bashrc
[ -r ~/script/lutaoact_functions.sh ] && . ~/script/lutaoact_functions.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -r ~/private-config/bashrc ] && . ~/private-config/bashrc
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /data/backup/bash-wakatime/bash-wakatime.sh ] && . /data/backup/bash-wakatime/bash-wakatime.sh
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}")";
}

#PS1='\[\033[1;31m\]\h\[\033[0m\]:\u \W \[\033[1;32m\]$(git_branch)\[\033[0m\]\$ '
PS1='\[\033[1;31m\]\u\[\033[0m\]:\W \[\033[1;32m\]$(git_branch)\[\033[0m\]\$ '

alias lsport='lsof -i -n -P | grep -i listen'
#alias proxy='/Users/lutao/sshuttle/sshuttle -r aws 0/0 -vv'

export GPG_TTY=$(tty)

# export GOROOT=/usr/local/Cellar/go/libexec # go1.9
export GOROOT=/usr/local/Cellar/go@1.10/1.10.8/libexec/go # go1.10

export GOPATH="$HOME/go"
#export KUBECONFIG="~/private-config/k8s-config.yml"
export KUBECONFIG="$HOME/.kube/config"

export TERM=xterm
export PATH="$HOME/go/bin:/usr/local/opt/ruby/bin:$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PERL_HASH_SEED=0x00
export PERL_PERTURB_KEYS=0

export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZE=100000
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE='pwd:exit:fg:bg:top:clear:cd:ls'
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

ulimit -S -n 10032

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm # install nvm by curl
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function autoconnect() {
  while true
  do
    ssh -v -N "$1"
    sleep 3
  done
}

shopt -s cdspell

alias k='kubectl'
alias kb='kubectl -n backend'
alias kf='kubectl -n frontend'
alias ka='kubectl -n algorithm'

alias mysqlt='mysql -h127.0.0.1 -P3306 -uroot -pmy-secret-pw -Dfortest'
alias mysqlgo='mysql -h127.0.0.1 -P3306 -uroot -pmy-secret-pw -Dielts_development'

function cdebug() {
  if [ -z "$1" ]; then
    docker run -it --rm -v /tmp:/tmp reg.qiniu.com/lutaoact/debug-tools
  else
    docker run -it --rm -v /tmp:/tmp --pid=container:"$1" --net=container:"$1" --cap-add all reg.qiniu.com/lutaoact/debug-tools
  fi
}

alias gitlab="cat /Users/lutao/me/gitlab.token"
alias github="cat /Users/lutao/me/github.token"
#alias mongogo="mongo test"

export BUNDLE_GEMFILE="./Gemfile"

export DEBUG_MODE=debug

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taolu/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/taolu/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taolu/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/taolu/Downloads/google-cloud-sdk/completion.bash.inc'; fi

alias blb='bazel build -c opt'
alias blt='bazel test -c opt --test_output=errors --keep_going'
alias blr='bazel run -c opt'

export BAZEL_USER_ROOT=~/tmp/llscache

# bazel output directory
export OUTPUT_DIR=~/tmp/llsoutput/git.llsapp.com

# ssh key used to pull codes from gitlab (git.llsapp.com)
export RSA_PRIVATE_KEY=$(cat ~/.ssh/lls.pem)

alias russellauth="kb port-forward deployment/russell-rpc-auth 8080"
alias russelluser="kb port-forward deployment/russell-rpc-user 8081:8080"
