autoload -U compinit promptinit
compinit
promptinit

prompt walters

#--- options --------
umask 0033

  setopt autocd
  setopt autopushd
unsetopt beep
unsetopt flowcontrol
  setopt histfindnodups
  setopt histsavenodups
  setopt incappendhistory
  setopt listpacked
  setopt pushdignoredups
  setopt pushdsilent
  setopt pushdtohome

#--- Variables ---------
source $ZSH/variables
source $ZSH/paths
source ~/.profile

#--- Aliases ---------
source $ZSH/aliases

#--- Dircolors ----------
source $ZSH/colors

#--- Keybindings ----------
source $ZSH/bindings
source $ZSH/completion

#source $ZSH/prompt
