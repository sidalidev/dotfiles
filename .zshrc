function updatepackages {
  echo '🎉  Update the formulae and Homebrew itself'
  brew update
  echo '🤔  What is outdated'
  brew outdated
  echo '🚀  Upgrade everything with'
  brew upgrade
  echo '🧹  Cleanup'
  brew cleanup
  echo 'Update Heroku'
  heroku update
  echo 'Update Vim Plugins'
  vim +PlugClean +qall
  vim +PlugUpgrade +qall
  vim +PlugInstall +qall
  vim +PlugUpdate +qall
  vim +CocInstall +qall
  vim +CocUpdate +qall
  echo '💎 Ruby and RoR versions'
  ruby -v
  rails -v
  echo '⌨️  Node, npm, Yarn versions'
  node -v
  npm -v
  echo '🐦 Flutter version'
  flutter --version
}

echo "🎬 Setting up zsh..."

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sid/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Misc aliases
alias checkinternet="ping google.com"
alias v="open -a /Applications/MacVim.app"
alias vh="v ."
# Config aliases
alias sourcezshrc="source ~/.zshrc"
alias updatepackages="updatepackages"
# Ruby/Rails aliases
alias b="bin/bundle"
alias r="bin/rails"
alias bi="b install"
alias bir="bi --redownload"
alias bd="bin/dev"
alias rsd="bd s"
alias rs="r s"
alias rc="r c"
alias rdbr="r db:drop db:create db:migrate db:seed"
# JS aliases
alias n="npm run"
alias y="yarn"
# Flutter
alias fb="flutter clean && flutter build appbundle"
# Heroku
alias hl="heroku logs -t"
alias hc="heroku console"
alias dock="docker-compose"

# Ruby configuration
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# The first line makes the chruby program available in the shell. The second line will automatically switch the current version of Ruby when you change directories if a hidden file indicates a specific Ruby version.
chruby ruby-3.1.0

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# You can set $NVM_DIR to any location, but leaving it unchanged from /usr/local/opt/nvm will destroy any nvm-installed Node installations upon upgrade/reinstall.

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#To activate the autosuggestions, add the following at the end of your .zshrc:
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# To activate the syntax highlighting, add the following at the end of your .zshrc:
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# If you receive "highlighters directory not found" err message, you may need to add the following to your .zshenv:
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
# You may also need to force rebuild `zcompdump`:
# rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
# chmod go-w '/usr/local/share'

# We've installed your MySQL database without a root password. To secure it run:
# mysql_secure_installation

# MySQL is configured to only allow connections from localhost by default

# To connect run:
# mysql -uroot

# To have launchd start mysql now and restart at login:
#   brew services start mysql
# Or, if you don't want/need a background service you can just run:
#   mysql.server start

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/sid/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

# export JAVA_HOME="/Applications/Android\ Studio.app/Contents/jre"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
  
echo "🚀 ZSH is ready"
