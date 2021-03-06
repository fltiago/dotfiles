export EDITOR=vim

if [ "$TERM" != 'dumb' ] && [ -n "$BASH" ] && [ -n "$PS1" ]
then
  if [ `/usr/bin/whoami` = 'root' ]
  then
    export PS1='\[\033[01;31m\]\h \[\033[01;34m\]\W \$ \[\033[00m\]'
  else
    PS1="\W \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.each_line.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]>\[\033[00m\] "
  fi
fi

alias prettyjson='python -mjson.tool'
