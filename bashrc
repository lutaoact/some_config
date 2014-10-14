# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}")";
}

PS1='\h:\W \u\[\033[1;32m\]$(git_branch)\[\033[0m\]\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
								    
alias ssh_mgsys="ssh -i kr_white.pem mgsys@54.250.141.112"
alias ssh_beta="ssh -i kr_white.pem mgsys@54.249.19.134"
alias ssh_beta2="ssh -i kr_white.pem mgsys@54.250.186.215"
alias ssh_dev1="ssh -i kr_white.pem mgsys@54.249.18.115"
alias ssh_ub="ssh ubuntu@119.254.108.248"
alias cn_ope='ssh -i ~/cnsango_ope.pem mgsys@119.15.139.29'
alias tw_ope='ssh -i ~/twsango_mgsys.pem mgsys@twsango_monitor'
alias mongogo='mongo budweiser-dev'
alias game='ssh game@119.15.139.4'
alias ll="ls -alFG"
alias grep='grep --color=auto'
export TERM=xterm
export PATH=$PATH:~/bin
#export NODE_ENV=cn_local_01
#export PERL5LIB="~/MgServer/pm:~/perl5"

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
export EDITOR=vim
export HISTSIZE=10000
export HISTCONTROL="ignoredups"
ulimit -S -n 10032
