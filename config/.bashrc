#
# ~/.bashrc
#


## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

echo "Bash"
alias ls='ls --color=auto'
alias vi='vim'
alias lsa="ls -a"
alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
alias clipit='xclip -sel clip'
alias open='xdg-open'
LS_COLORS=$LS_COLORS:'di=0;32:' ; export LS_COLORS
#export PATH=$PATH:/home/cs/git/enum4linux-ng/enum4linux-ng.py
# alias pacdiff=_Pacdiff
################################################################################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/sbin"
