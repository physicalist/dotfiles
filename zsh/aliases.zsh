# ZSH aliases
# some sane defaults
if [ `uname -s` = "Linux" ] || [ -e `$(which brew) --prefix coreutils` ]
then
   alias ls='ls --color=auto -F'
fi
alias ll='ls -lh'
alias la='ls -ah'
alias cp='cp -r'
alias cls=clear
alias ..="cd .."
alias cd..="cd .."

# -- coding helpers ---
# (should go to separate files)
#
# convenient shorties for opening and analyzing (hexdump) files
alias hexless='hexdump -C $1 | less'
# qt-based ipython with inline matplotlib graphs
alias qpython='ipython qtconsole --pylab=inline'

# simple chmod
for i in {0..7}; do
    for j in {0..7}; do
    for k in {0..7}; do
        alias ${i}${j}${k}="chmod ${i}${j}${k}"
    done
    done
done

# reload zsh config
src()
{
#    autoload -U zrecompile
#    [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
#    [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
    rehash
    source ~/.zshrc
}

git_help()
{
echo -e "
 Glob Qualifiers                        Modifiers ('libowfat/unix.a')
   /  directories                         h  libowfat
   .  plain files                         r  libowfat/unix
   @  symbolic links                      e  a
   =  sockets                             t  unix.a
   p  named pipes (FIFOs)                 l  libowfat/unix.a (lowercase)
   *  executable plain files (0100)       u  LIBOWFAT/UNIX.A (uppercase)
   %  block special files                 p  hist: print new command
   %  character special files             q  quote substituted words
   r  owner-readable files (0400)         Q  remove one level of quotes
   w  owner-writable files (0200)         x  like q, break into whitespaces
   x  owner-executable files (0100)
   A  group-readable files (0040)       Glob Operators
   I  group-writable files (0020)         *      string, also null string
   E  group-executable files (0010)       ?      character
   R  world-readable files (0004)         [...]  enclosed character
   W  world-writable files (0002)         <x-y>  number between x and y
   X  world-executable files (0001)       (...)  enclosed pattern
   s  setuid files (04000)                (x|y)  x or y
   S  setgid files (02000)                ^x     not x
   t  files with the sticky bit (01000)   x~y    x but not y
   fspec  files with rights spec          x#     any number of occurrences
                                          x##    at least one occurrence
 print -l                # print list
 print *(m-1)            # files modified the last day
 print *(a1)             # files accessed the last day
 print *(@)              # (sym|hard)links
 print *(Lk+50)          # files larger than 50kB
 print *(Lk-50)          # files smaller than 50kB
 print *(.c|.h)          # files with suffix .c or .h
 print **/*.c            # *.c files below \$PWD (recursive)
 print **/*.c~file.c     # *.c files below \$PWD (recursive) except file.c
 print (foo|bar).*       # files beginning with foo or bar
 print *~*.*             # files without an '.'
 print **/*(g:users:)    # files belonging to group users
 chmod 644 *(.^x)        # make all non-executable files publically readable

 for i (*) print -- \$i   # easy loop (setopt shortloops)

 Expansions
   \$(...), \`...\`         # substitute command ...
   \$[...]                # substitue arithmetic expression ...
   {n1..n2}              # sequence from n1 to n2, leading 0 may be prepended
"
}

# Linux system-specific aliases (note: move to own folder)
if [ `uname -s` = "Linux" ]; then	# might want to use $OSTYPE
    # OSX-like 'open' command for Linux
    open()
    {
        for i in $*
        do
            xdg-open "$i"
        done
    }

    # Ubuntu-specific
    if [[ -e /etc/lsb-release && `lsb_release -i -s` = "Ubuntu" ]]; then
        alias apt=aptitude
        alias port=aptitude
    fi

    # Arch-Linux specific
    if [ -e "/etc/arch-release" ]; then
        alias pacman="sudo =pacman"
        for cmd in S Si Ss Syu Q Qi Qe Ql Qo Qs Rc Rs; do
            alias ${cmd:l}="sudo =pacman -${cmd}"
        done
    fi
fi

