# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use 256 colors 
export TERM='xterm-256color'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="my-darkblood"
ZSH_THEME="lambda"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github colored-man colored-man extract archlinux systemd zsh-256color)

# User configuration
#export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# export MANPATH="/usr/local/man:$MANPATH"

# oh-my-zsh plugins and themes
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# ~/.bashrc
#


# My Bash Libraries 
source /home/gmello/bin/libraries/connection.sh
source /home/gmello/bin/libraries/mount.sh

# Tell my user instance of systemd init to use my customized PATH
systemctl --user import-environment PATH


# umask
umask 077

#HISTORY 
export HISTSIZE=21
#erase history 
echo " " > /home/gmello/.zsh_history

#CHROOTS
export ARCH01="/home/gmello/SECURITY/JAIL/arch01/home/gmello" 

#Aliases 
# ls
alias ls='ls --color=auto -p -h'

# rm
alias rm='rm -i'

# Misc
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias df='df -h'
alias du='du -csh'
alias osmo="osmo 2> /dev/null &"
alias nospace="nospace 2> /dev/null"
alias mpc='mpc -p 6000'
alias uzbl='uzbl-tabbed www.duckduckgo.com'
alias tmux-vc='tmux -f /home/gmello/.tmuxvc.conf attach -t vc'
alias ncmpcpp='mpd 2> /dev/null; ncmpcpp'
alias pacman='pacman --color=auto'
alias podcast='podbeuter'
alias news='newsbeuter'
k-youtube-dl(){ kill -SIGKILL $(pgrep youtube-dl); }
alias links="links www.duckduckgo.com"
alias suspend="sudo systemctl suspend"

_platformio(){ 
    if test "$(echo $VIRTUAL_ENV)" != "/home/gmello/bin/platformio/venv"; then
        source ~/bin/platformio/venv/bin/activate 
        platformio ${@} 
        deactivate
    else
        platformio ${@}
        deactivate
    fi
}

# tmux sessions
alias net='tmux attach -t connect'
alias utils='tmux attach -t util'
alias sys='tmux attach -t sys'
alias dev='tmux attach -t dev'
alias vc='tmux -f /home/gmello/.tmuxvc.conf attach -t vc'

# Vim
alias vim='vim -u /home/gmello/.vimrc'
alias vim-tmux='vim -u /home/gmello/.vimrc-tmux'
alias vim-c='vim -u /home/gmello/.vimrc-c'
alias vim-python='vim -u /home/gmello/.vimrc-python'

# pacman 
alias pkg-remove='sudo pacman -Rs'
alias pkg-orphan-dp='pacman -Qdt'
alias pkg-orphan='pacman -Qt'
alias pkg-outdated='pacman -Qu'
alias pkg-outdated-dp='pacman -Qdu'
alias pkg-files='pacman -Ql'
alias pkg-info='pacman -Qi'
alias pkg-info-rep='pacman -Si'
alias pkg-manual='pacman -Qi'
alias pkg-syncdb='sudo pacman -Sy'

# Pass

#alias facebookpass="pass show Facebook/login | tail -n1 | xclip -selection clipboard; sleep 9s; echo " " | xclip -selection clipboard"
function facebookpass(){ echo " " | xclip -selection clipboard && pass show Facebook/login | tail -n 1 | xclip -selection clipboard; sleep 9s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit  } 
#alias githubpass="pass show Github/login | tail -n1 | xclip -selection clipboard"
function githubpass(){ pass show Github/login | tail -n1 | xclip -selection clipboard; sleep 10s; printf %s " " | xclip -selection clipboard; sudo -k; exit }
#alias twitterpass="pass show Twitter/login | tail -n1 | xclip -selection clipboard"
function twitterpass(){ pass show Twitter/login | tail -n1 | xclip -selection clipboard; sleep 10s; printf %s " " | xclip -selection clipboard; sudo -k; exit}
#alias ircpass="pass show IRC-Freenode/login | tail -n1 | xclip -selection clipboard"
function ircpass(){ pass show IRC-Freenode/login | tail -n1 | xclip -selection clipboard; sleep 10s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit } 
#alias googlepass="pass show Google/login | tail -n1 | xclip -selection clipboard"
function googlepass(){ pass show Google/login | tail -n1 | xclip -selection clipboard; sleep 10s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit }
#alias rootpass="pass show root/login | tail -n1 | xclip -selection clipboard"
function rootpass(){ pass show root/login | tail -n1 | xclip -selection clipboardx; sleep 10s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit }
function routerpass(){ pass show Router/login | tail -n1 | xclip -selection clipboardx; sleep 10s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit }
function asanapass(){ pass show asana/login | tail -n1 | xclip -selection clipboardx; sleep 10s; printf "%s" " " | xclip -selection clipboard; sudo -k; exit }

# Variables
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/gmello/bin:/home/gmello/bin:/home/gmello/.gem/ruby/2.3.0/bin/"
TMOUT=30000
export LS_COLORS
DISPLAY=:0.0
JAIL01=/home/gmello/SECURITY/JAIL/arch01/home/gmello
SSHSERVER="187.23.12.153"

## Color sets 
LS_COLORS='rs=0:di=0;36:fi=1;37:ln=01;34:mh=00:pi=00;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

##Opam
source /home/gmello/.opam/opam-init/init.zsh 


# Toilet
#if test $(tty) = /dev/pts/0; then
# zsh /home/gmello/bin/wakeupneo.sh
#fi

# Xdotool
#desktopid=$(xdotool get_desktop)
#right_desktop(){
#    xdotool behave_screen_edge right set_desktop $((desktopid + 1)) &
#}

#left_desktop(){
#    xdotool behave_screen_edge left set_desktop $((desktopid - 1)) &
#}

#right_desktop &> /dev/null  
#left_desktop  &> /dev/null 
#

xinput set-prop 'ETPS/2 Elantech Touchpad' 'libinput Tapping Enabled' 1
