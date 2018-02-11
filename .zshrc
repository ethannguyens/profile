
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"

# Example aliases
alias zshconfig="sublime ~/.zshrc"
alias ohmyzsh="sublime ~/.oh-my-zsh"
alias hosts="sublime /etc/hosts"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------

# GitHub
function github-create(){
    curl -u 'ethannguyens' https://api.github.com/user/repos -d '{"name": '$1'}'
}

function github-track(){
    git remote add origin git@github.com:ethannguyens/$1.git
}


alias add='git add -A'
alias push='git push'
alias pull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias fetch='git fetch origin'
alias log='git log'
alias status='git status'
alias diff='git diff'
alias commit='git commit -m'
alias merge='git merge'
alias branch='git branch'
alias checkout='git checkout'
alias remote-add='git remote add'
alias remote-remove='git remote rm'
alias clone='git clone'
alias tag-all='git tag -a -m'
alias reflog='git reflog'
alias reset='git reset'

# leverage an alias from the ~/.gitconfig
alias hist='git hist'
alias lg1='git lg1'
alias lg2='git lg2'
alias lg='git lg'

# -------------------------------------------------------------------
# GIT FUNCTION
# -------------------------------------------------------------------
function gitacp() {
    git add .
    git commit -a -m "$1"
    git push
}

funciton del-branch() {
    git branch -D $1
    git push origin --delete $1
}

function checkout-new() {
    git checkout -b $1
    git push --set-upstream origin $1
}

# -------------------------------------------------------------------
# STASH
# -------------------------------------------------------------------
alias st='git stash save'
alias st-list='git stash list'
alias st-drop='git stash drop'
alias st-clear='git stash clear'
alias st-pop='git stash pop'
alias st-apply='git stash apply'

function st-apply-recent() {
    git stash apply stash^{/$1}
}

# -------------------------------------------------------------------
# Capistrano aliases
# -------------------------------------------------------------------

alias capd='cap deploy'


# -------------------------------------------------------------------
# Symfony aliases
# -------------------------------------------------------------------

alias symcl='php app/console cache:clear --no-debug'
alias symcla='php app/console assetic:dump --no-debug'
#alias symaiaw = 'php app/console assets:install --symlink && php app/console assetic:watch'


# -------------------------------------------------------------------
# ELYSIUM
# -------------------------------------------------------------------

alias elysium='cd ~/Work/elysium'
alias vagrant-box='cd ~/Work/vagrant-boxes/elysium8-box'
alias apache-config='cd ~/Work/apache-configuration'
alias gr='~/Work/elysium/gradlew'
alias findme='bash ../findme.sh'

function restart-tomcat() {
    cd ~/Work/vagrant-boxes/elysium8-box
    vagrant ssh -c "sudo service tomcat7 restart && sudo service httpd restart"
    cd -
}

# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------

alias cl='clear'
alias rmdir='rm -rf'

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# return my IP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# Change directory to the current Finder directory
function cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# -------------------------------------------------------------------
# APP ALIAS
# -------------------------------------------------------------------
alias app-list='sudo find / -iname *.app'

alias idea='open -b com.jetbrains.intellij .'
alias chrome='open -a Google\ Chrome'
alias term='open -a Terminal'
alias term-new='open -a Terminal "`pwd`"'
alias spotify='open -a spotify'
alias email='open -a open -a Microsoft\ Outlook'
alias setting='open -a System\ Preferences'
alias email='open -a open -a Microsoft\ Word'
alias calc='open -a open -a Calculator'
alias slack='open -a open -a Slack'

export REACT_EDITOR=wstorm

# -------------------------------------------------------------------
# SSH KEY
# -------------------------------------------------------------------
alias ssh-key='sublime ~/.ssh'

# -------------------------------------------------------------------
# PATH
# -------------------------------------------------------------------
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin
export PATH="/Users/ethannguyen/Library/Android/sdk/tools":$PATH
export PATH="/Users/ethannguyen/Library/Android/sdk/platform-tools":$PATH
export PATH=$HOME/local/bin:$PATH
export ANDROID_HOME="/Users/ethannguyen/Library/Android/sdk"
export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME="/Users/ethannguyen/Library/apache-maven-3.3.9"
export PATH="/Users/ethannguyen/Library/apache-maven-3.3.9/bin":$PATH
export ANT_HOME="/Users/ethannguyen/Library/apache-ant-1.9.6"
export PATH="/Users/ethannguyen/Library/apache-ant-1.9.6/bin":$PATH
export PATH="/Users/ethannguyen/Library/mitmproxy-0.18.2-osx":$PATH
export PATH="~/.nvm":$PATH

export NVM_DIR="/Users/ethannguyen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/sbin:$PATH"
