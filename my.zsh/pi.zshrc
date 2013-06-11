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
source ~/.zsh/variables
source ~/.zsh/paths
source ~/.profile

#--- Aliases ---------
source ~/.zsh/aliases

#--- Dircolors ----------
source ~/.zsh/colors

#--- Keybindings ----------
source ~/.zsh/bindings
source ~/.zsh/completion

#source ~/.zsh/prompt
