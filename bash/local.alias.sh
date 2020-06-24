# system
alias ubash="curl -s \"https://raw.githubusercontent.com/yuanmomo/shell-utils/master/bash/local.alias.sh?(date \"+%N\")\" > ~/.local.bashrc  && . ~/.local.bashrc"

alias grep='grep -i '
alias c='clear'
alias l='locate'
alias psg='ps -ef | grep -i '
alias k9='kill -9'
alias ll='ls -alh'
alias llg='ls -alh | grep -i '
alias mv='mv -i '
alias rm='rm -i '
alias shde='sh -xv '
alias tz='tar -zvxf '
alias h='history '
alias hg='history | grep -i '
alias hd='head -n '
alias h10='head -n 10 '
alias tl='tail -n '
alias t10='tail -n 10 '
alias tf='tail -f '
alias tel='telnet localhost '
alias e='exit'
alias lsof='lsof -i | grep -i='
alias du0='du -ah --max-depth=1 .  | sort -r -h'
alias p='cd ..'
alias vi='vim '
alias nts='netstat -anp | grep -i '
alias nlts='netstat -anp | grep -i  -i listen| grep -i  '
alias ais='sudo apt-get install -y '
alias yis='sudo yum install -y '


############### fish shell ###############
alias sf='source $OMF_CONFIG/before.init.fish'

############### docker ###############
alias dps='sudo docker ps'
alias drm='sudo docker rm -f '
alias dexec='sudo docker exec -it '
alias dps='sudo docker ps'
alias ding='sudo docker rmi $(sudo docker images -q -f dangling=true)'

############### git shell ###############
alias gc='git clone '
alias grv='git remote -v '
alias gs='git status '
alias gt='git stash '
alias gsp='git stash pop '
alias gres='git reset --hard'
alias glas='git log -1 HEAD '
alias gfe='git fetch '
alias gp='git pull '
alias gpm='git pull origin master  '
alias gpo='git pull origin  '
alias gbrm='git branch | grep -iv "*" |xargs git branch -d  '
alias gfco='git fetch origin; git checkout  '
alias gco='git checkout  '
alias gb='git branch  '


############### gradle ###############
alias gbd='bash gradlew build -x test'


########################## bash configurations #########################
export PS1="[\u@\H \W]\$"

# 扩展字段匹配
shopt -s extglob

# 更正在cd命令中出现的小的拼写错误
shopt -s cdspell

#  shell vi mode
set -o vi
### end ###
