export PS1="[cs@zsh] %~$ "

# mac os
# export PS1="mitchhert@Mitchells-Air %~ %#" # mac os default prompt
# alias ls='gls -p --color' # mac os
alias whatsmyip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"


# useful
alias vim='nvim'
alias countlines='git ls-files | xargs wc -l'
export CLICOLOR=1
export PATH=$PATH:$(go env GOPATH)/bin
[ -e ~/.dircolors ] && eval $(gdircolors -b ~/.dircolors) || eval $(gdircolors -b) # idk what the hell this is

# openai key
export OPENAI_API_KEY="ADD_KEY"

# jira key
export JIRA_API_TOKEN="ADD_KEY"
