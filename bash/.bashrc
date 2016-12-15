#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#source /home/gmello/bin/libraries/connection.sh
#source /home/gmello/bin/libraries/mount.sh

# Tell my user instance of systemd init to use my customized PATH
systemctl --user import-environment PATH


# umask
umask 077

#Aliases 

# ls
alias ls='ls --color=auto -p -h'
ll(){ [ $# -eq 0 ] && ls -l --color=auto -p -h $PWD ||  ls -l --color=auto -p -h $@;  } # list long 
ld(){ [ $# -eq 0 ] && ls -d --color=auto -p -h $PWD ||  ls -d --color=auto -p -h $@;  } # list directory 
la(){ [ $# -eq 0 ] && ls -A --color=auto -p -h $PWD ||  ls -A --color=auto -p -h $@;  } # list all
lc(){ [ $# -eq 0 ] && ls -l -c -t --color=auto -p -h $PWD ||  ls -l -c -t --color=auto -p -h $@;  } # list last change
lcr(){ [ $# -eq 0 ] && ls -l -c -t -r --color=auto -p -h $PWD ||  ls -l -c -t -r  --color=auto -p -h $@;  } # list last change reverse
lac(){ [ $# -eq 0 ] && ls -l -c -t -u --color=auto -p -h $PWD ||  ls -l -c -u  --color=auto -p -h $@;  } # list last accessed
lacr(){ [ $# -eq 0 ] && ls -l -c -u -r  --color=auto -p -h $PWD ||  ls -l -c -u -r --color=auto -p -h $@;  } # list last accessed reverse
lz(){ [ $# -eq 0 ] && ls -S --color=auto -p -h $PWD ||  ls -S  --color=auto -p -h $@;  } # list by size
lzr(){ [ $# -eq 0 ] && ls -S -r --color=auto -p -h $PWD ||  ls -S -r  --color=auto -p -h $@;  } # list by size reverse
li(){ [ $# -eq 0 ] && ls -i --color=auto -p -h $PWD ||  ls -i --color=auto -p -h $@;  } # list nodes 
lug(){ [ $# -eq 0 ] && ls -n --color=auto -p -h $PWD ||  ls -n --color=auto -p -h $@;  } # list long with userid and group id

# rm
alias rm='rm -i'
rf(){ rm -vf -- $@; } 
rd(){ rm -vd -- $@; } 
rvf(){ rm -rvf -- $@; } 

# Misc
alias mv='mv -i'
alias cp='cp -i'
alias du='du -h'
alias df='dh -h'
alias du='du -csh'
alias chromium="sudo schroot -c arch01 -- export DISPLAY=:0.0; chromium --user-data-dir=/home/gmello/.config/chromium"
alias osmo="osmo 2> /dev/null &"
alias nospace="nospace 2> /dev/null"

# tmux sessions
alias net='tmux attach -t connect'
alias term='tmux attach -t term'
alias sys='tmux attach -t sys'
alias vc='tmux -f /home/gmello/.tmuxvc.conf attach -t vc'

# Vim
alias vim='vim -u /home/gmello/.vimrc'
alias vim-tmux='vim -u /home/gmello/.vimrc-tmux'
alias vim-c='vim -u /home/gmello/.vimrc-c'
alias vim-python='vim -u /home/gmello/.vimrc-python'

alias mpc='mpc -p 6000'
alias uzbl='uzbl-tabbed www.duckduckgo.com'
alias tmux-vc='tmux -f /home/gmello/.tmuxvc.conf attach -t vc'
alias ncmpcpp='mpd 2> /dev/null; ncmpcpp'
alias pacman='pacman --color=auto'
alias podcast='podbeuter'
alias news='newsbeuter'
k-youtube-dl(){ kill -SIGKILL $(pgrep youtube-dl); }
alias links="links www.duckduckgo.com"
#alias suspend="sudo systemctl suspend"
#cd(){ pushd $1 > /dev/null; }
#bd(){ popd > /dev/null; } 


# Shel Options 
shopt -s dotglob
shopt -s extglob
shopt -s globstar

# Variables
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/gmello/bin:/home/gmello/bin:/home/gmello/.gem/ruby/2.3.0/bin/"
TMOUT=30000
HISTFILESIZE=20
HISTSIZE=20
export LS_COLORS

## Color sets 
PS1="\[\e[1;30m\] \!\[\e[0m\]\[\e[0;35m\] \t \[\e[0m\]\[\e[1;36m\]\u@\h \W \$ \[\e[0m\]"
PS2="\[\e[1;30m\] \!\[\e[0m\]\[\e[0;35m\] \t \[\e[0m\]"
PS4="$LINENO:" #Useful to debugging lines of scripts with bash -x
LS_COLORS='rs=0:di=01;36:ln=01;34:mh=00:pi=00;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

