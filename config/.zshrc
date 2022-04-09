export PS1="[cs@zsh] %~$ "
alias python='/opt/homebrew/bin/python3.9'
alias pip='/opt/homebrew/bin/pip3.9'
# alias ls='ls -p --color'
alias ls='ls -p'
export PYTHONPATH=$PYTHONPATH:"/Users/connorsheehan/Library/Python/3.8/lib/python/site-packages/"
alias whatsmyip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias javac='/opt/homebrew/Cellar/openjdk@11/11.0.12/bin/javac'
alias java='/opt/homebrew/Cellar/openjdk@11/11.0.12/bin/java'
alias zip2john='/opt/homebrew/Cellar/john-jumbo/1.9.0/share/john/zip2john'
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
LS_COLORS=$LS_COLORS:'ow=37;42:'
