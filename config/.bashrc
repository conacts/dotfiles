#
# ~/.bashrc
#
# echo "Welcome to Bash"
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias vi='vim'
export PS1="[cs@bash] %~$ "
alias ls='ls --color'
alias vi='vim'
alias svi="sudo vim"
alias lsa="ls -a"
alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
alias clipit='xclip -sel clip'
alias open='xdg-open'

# LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
# export PATH=$PATH:/home/cs/git/enum4linux-ng/enum4linux-ng.py
################################################################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/opt/homebrew/bin"

export PYTHONPATH="/Users/connorsheehan/junction/ml/projects/conpack:/Users/connorsheehan/junction/ml/llama-recipes/src"
