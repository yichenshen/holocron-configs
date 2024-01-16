# .bash_profile

# User specific environment and startup programs

# Term color
export TERM="xterm-256color"
# Locale
export LC_ALL="en_US.UTF-8"

# Java Home
export JAVA_HOME="/usr/lib/jvm/java"

# PATH
PATH="$HOME/.local/bin:$PATH"

# Rbenv
PATH="$HOME/.rbenv/shims:$PATH"
PATH="$HOME/.rbenv/bin:$PATH"
PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Force source .bashrc if on SSH
if { [ $SSH_TTY ] || [ $ET_VERSION ]; } && [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
