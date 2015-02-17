#prompt_settings
export CLICOLOR=1
export TERM=xterm-256color

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
RESET="\[\033[0;m\]"

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
		    echo "("${ref#refs/heads/}")"
}

PS1="$RED|$BLUE\w$RED| $GREEN\$(parse_git_branch)$BLUE$YELLOW:$RESET "

#git profile aliases for command line options
source $HOME/.git_aliases.sh

#git autocompletion for git completion
source $HOME/.git_completion.bash

#daily usage aliases
alias ..="cd ..";
alias ....="cd ../../";

# editor settings
export EDITOR=vim

# irb alias
alias irb="irb -r irb/completion"

# go lang alias
alias gb="go build"
alias gr="go run"

# rails s
alias server="bundle exec rails s -b 0.0.0.0"

# bundle aliases
alias bi="bundle install"
alias be="bundle exec"
