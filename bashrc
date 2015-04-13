# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

function git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
  echo "("${ref#refs/heads/}")";
}

PS1='\h:\u \w \[\033[1;32m\]$(git_branch)\[\033[0m\]\$ '
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
								    
alias ssh_ub="ssh ubuntu@119.254.108.248"
alias sshh="ssh ubuntu@119.254.110.62"
alias mongogo='mongo budweiser-dev'
alias mongom='mongo maui-dev'
alias lsport='lsof -i -P | grep -i listen'
alias ll="ls -alFG"
alias grep='grep --color=auto'
alias ls='ls -G'
alias proxy='/Users/lutao/sshuttle/sshuttle -r aws 0/0 -vv'
alias validate_srt="perl ~/gale/scripts/validate_srt.pl"
alias load_kp_for_de="coffee scripts/load_key_point_json_to_db.coffee de"
alias load_kp_for_nceone="coffee scripts/load_key_point_json_to_db.coffee nceone"
alias load_srt_for_de="coffee scripts/load_srt_json_to_db.coffee de"
alias load_srt_for_nceone="coffee scripts/load_srt_json_to_db.coffee nceone"

export TERM=xterm
export PATH=/Users/lutao/android-sdk-macosx/platform-tools:/Users/lutao/android-sdk-macosx/tools:$PATH:~/bin

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
export EDITOR=vim
export HISTSIZE=10000
export HISTCONTROL="ignoredups"
ulimit -S -n 10032

export NVM_NODEJS_ORG_MIRROR='http://dist.u.qiniudn.com'
source $(brew --prefix nvm)/nvm.sh
