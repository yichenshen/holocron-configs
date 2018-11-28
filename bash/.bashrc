# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source VTE for Tilix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

# User specific aliases and functions

if [ $GNOME_TERMINAL_SCREEN ] || [ $SSH_CLIENT ] || [ $SSH_TTY ]; then
  if [ -e /usr/bin/fish ]; then
    exec fish
  fi
fi
