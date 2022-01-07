#
# ~/.bashrc
#
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias vi='vim'
echo "Welcome to Bash"
export PYTHONPATH=$PYTHONPATH:"/Users/connorsheehan/Library/Python/3.8/lib/python/site-packages/"
export PS1="[cs@bash] %~$ "
alias ls='ls -p'
alias vi='vim'
alias svi="sudo vim"
alias lsa="ls -a"
alias serf="sudo surfshark-vpn attack"
alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
alias clipit='xclip -sel clip'
alias open='xdg-open'
# alias python='/usr/bin/python3'
# LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
# export PATH=$PATH:/home/cs/git/enum4linux-ng/enum4linux-ng.py
################################################################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/opt/homebrew/bin"
