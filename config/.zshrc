export PS1="[cs@zsh] %~$ "
# export JIRA_API_TOKEN=ATATT3xFfGF06hSA0SQFlkI94V01W8Bn7Bo0XuWJ-F_6H5_YDvOgOlFv5wojGfIneYoxtUTWE155Z_l_38ZD788aSoCdSEJ6Xlpz7YLjp9HYhb9je1O9gv72NhLDn_vpKOhRz12EeHT5hwrq-tRFigSEuJhWEi8JzEaleriU-wYq_5dZQl1jvd0=2B8C8EBC
# export PS1="mitchhert@Mitchells-Air %~ %#" 
alias ls='gls -p --color'
# alias python='/opt/homebrew/bin/python3.9'
# alias python3='/opt/homebrew/bin/python3.9'
alias whatsmyip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias vim='nvim'
alias countlines='git ls-files | xargs wc -l'
export CLICOLOR=1
export PATH=$PATH:$(go env GOPATH)/bin
[ -e ~/.dircolors ] && eval $(gdircolors -b ~/.dircolors) || eval $(gdircolors -b)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias loginschoolpc="ssh cvs5488@e5-cse-cbgpu02.eecscl.psu.edu"
# convert +append img1 img2 -colorspace RGB out.png

# openai key

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

# Created by `pipx` on 2024-01-10 06:27:08
export PATH=$PATH:/Users/connorsheehan/.local/bin
export PATH=/opt/homebrew/Caskroom/sqlcl/23.4.0.023.2321/sqlcl/bin:"$PATH"

export PYTHONPATH="/Users/connorsheehan/junction/ml/projects/conpack:/Users/connorsheehan/junction/ml/llama-recipes/src"
