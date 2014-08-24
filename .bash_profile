# .bash_profile

# Get the aliases and functions
#if [ -f ~/.bashrc ]; then
#	. ~/.bashrc
#fi

# Get the global settings
. /etc/bash.bashrc

# User specific environment and startup programs


# getColor sets $colorCode to the correct code for the given color
getColor () {
        case $1 in
                red) colorCode="\033[31;1m" ;;
                grey) colorCode="\033[30;1m" ;;
                green) colorCode="\033[32;1m" ;;
                yellow) colorCode="\033[33;1m" ;;
                blue) colorCode="\033[34;1m" ;;
                pink) colorCode="\033[35;1m" ;;
                cyan) colorCode="\033[36;1m" ;;
                white) colorCode="\033[37;1m" ;;
                underline) colorCode="\033[4;1m" ;;
                italic) colorCode="\033[5;1m" ;;
		normal) colorCode="\033[0;m" ;;
        esac
        }

# makeColor prints $2 in the color given by $1
makeColor () {
        getColor $1
        echo -e "\[${colorCode}\]$2\[\033[0;m\]"
        }

set_prompt () {
	local last_command=$? # This allows us to color based on exit status
	PS1=""
	PS1+="`makeColor white [`"
	PS1+="`makeColor cyan \\\u@\\\h:`"
	PS1+=" "
	PS1+="`makeColor green \\\w`"
	PS1+="`makeColor white ]`"
	PS1+=" "
	if [[ $last_command == 0 ]]; then
		PS1+="`makeColor white $` "
	else
		PS1+="`makeColor red $` "
	fi
	}
PROMPT_COMMAND='set_prompt'

alias ls="ls --color=always"
alias playcd="mpv -cdrom-device /dev/sr0 cdda://"
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export MAKEFLAGS='-j 8'
alias make="make $MAKEFLAGS"
alias vi=vim
gcc_parallel="-floop-parallelize-all -ftree-parallelize-loops=4"
alias clang="clang -Werror=int-conversion -Werror=int-to-pointer-cast -Werror=return-type -Wall"
alias gcc="gcc -std=gnu11 -Werror=int-to-pointer-cast -Werror=return-type -Wall -Werror"
export CXXFLAGS="-std=c++1y -Werror=int-to-pointer-cast -Werror=return-type  -Wall -Werror -pedantic"
alias g++="g++ $CXXFLAGS"
alias clang++="clang++ $CXXFLAGS"
alias j8="j8 -c"
alias man="man -S 3,2,1,n,l,8,0,5,4,9,6,7"
alias grep="grep --color=auto"
alias ta="tmux attach"
alias as="as --march=generic64"
alias bb="cd ~/Documents/asm/barebones"
alias ocaml="rlwrap ocaml"
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/lib64:/opt/cuda/lib64:$LD_LIBARY_PATH
export EDITOR=/usr/bin/vim
export DISPLAY=:0
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
#export PS1='\[\033[1m\][\[\033[1;34m\]\u@\h:\[\033[1;32m\] \w\[\033[0m\]\[\033[1m\]] $ \[\033[0m\]'
#export PS1="`makeColor white [``makeColor cyan \\\u@\\\h:` `makeColor green \\\w``makeColor white '] \$'` "
export PS1="$(tput bold)$(tput setaf 7)[$(tput setaf 6)\\u@\\h: $(tput setaf 2)\\w$(tput setaf 7)] $ $(tput sgr0)"

# Environment variable to build KF5
# See http://community.kde.org/Frameworks/Building
export KF5=/home/joel/Packages/kde
export QTDIR=/home/joel/Packages/qt5/qtbase
export XDG_DATA_DIRS=$KF5/share:$XDG_DATA_DIRS:/usr/share
export XDG_CONFIG_DIRS=$KF5/etx/xdg:$XDG_CONFIG_DIRS:/etc/xdg
export PATH=$KF5/bin:$QTDIR/bin:$PATH:~/Documents/cs350-os161/sys-161/bin:~/Documents/cs350/sys-161/tools/bin:~/Documents/cs350-os161/sys-161/tools
export QT_PLUGIN_PATH=$KF5/lib/plugins:$KF5/lib64/plugins:$KF5/lib/x86_64-linux-gnu/plugins:$QTDIR/plugins:$QT_PLUGIN_PATH
export QML2_IMPORT_PATH=$KF5/lib/qml:$KF5/lib64/qml:$KF5/lib/x86_64-linux-gnu/qml:$QTDIR/qml
export CMAKE_PREFIX_PATH=$KF5:$CMAKE_PREFIX_PATH

# Android Studio needs JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk/"
# Make CMake error messages more colourful


shopt -s cmdhist

#[ -n $TMUX ] && tmux attach || tmux

# OPAM configuration
. /home/joel/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
