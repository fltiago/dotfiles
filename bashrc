
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR=vim

# Source tmuxinator.bash
source ~/.bin/tmuxinator.bash

# PS1 with branch
function git_branch {
  [ -d .git ] && git name-rev --name-only @
}
export PS1='\e];\s\a\n\e[33m\w \e[36m($(git_branch))\e[m $ '
