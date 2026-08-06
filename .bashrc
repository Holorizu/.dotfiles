# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export SUDO_EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

export LIBVA_DRIVER_NAME=nvidia
export __GLX_VENODR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Alias
alias ff=fastfetch
alias lg=lazygit
alias wf=./wifi.sh

export PATH=$PATH:/home/marcus-doge/.local/bin

eval "$(oh-my-posh init bash --config ~/ompthemes/catppuccin_mocha.omp.json)"

export QT_QPA_PLATFORMTHEME=qt6ct
