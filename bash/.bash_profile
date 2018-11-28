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

# Force source .bashrc if on SSH
if { [ $SSH_TTY ] || [ $SSH_CLIENT ]; } && [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
