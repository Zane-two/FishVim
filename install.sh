#!/bin/env bash

# Init option {{{
Color_off='\033[0m'       # Text Reset

# terminal color template {{{
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White
# }}}

# version
Version='2.1.0-dev'
#System name
System="$(uname -s)"

# }}}

# need_cmd {{{
need_cmd () {
  if ! hash "$1" &>/dev/null; then
    error "?????? '$1' ?????????????????????"
    exit 1
  fi
}
# }}}

# success/info/error/warn {{{
msg() {
  printf '%b\n' "$1" >&2
}

success() {
  msg "${Green}[???]${Color_off} ${1}${2}"
}

info() {
  msg "${Blue}[???]${Color_off} ${1}${2}"
}

error() {
  msg "${Red}[???]${Color_off} ${1}${2}"
  exit 1
}

warn () {
  msg "${Yellow}[???]${Color_off} ${1}${2}"
}
# }}}

# echo_with_color {{{
echo_with_color () {
  printf '%b\n' "$1$2$Color_off" >&2
}
# }}}

# ??????linux???????????????
function get_linux_distro()
{
	if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
	elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
	elif grep -Eq "Raspbian" /etc/*-release; then
        echo "Raspbian"
	elif grep -Eq "uos" /etc/*-release; then
        echo "UOS"
	elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
	elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
	elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
	elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
	elif grep -Eq "Parrot" /etc/*-release; then
        echo "Parrot"
	elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
	elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
	elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
	elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
	elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
	elif grep -Eq "Gentoo" /etc/*-release; then
        echo "Gentoo"
	elif grep -Eq "alpine" /etc/*-release; then
        echo "Alpine"
	else
        echo "Unknown"
    fi
}

mv vimrc .vimrc

# ????????????
function get_datetime()
{
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

echo ":: ??????????????????????????????nvim??????vim????????????"
echo ":: ????????????????????????????????????????????????`Vim_Back?????????`"
echo ":: ??????????????????linux????????????????????????????????????"
echo :: ??????1??????????????????????????????
read if_edit_sources

if [ $if_edit_sources = "1" ]; then

  #####
  echo "   "
  echo "   "
  echo_with_color ${Yellow} "        _____ _     _  __     ___             ___           _        _ _ "
  echo_with_color ${Yellow} "       |  ___(_)___| |_\ \   / (_)_ __ ___   |_ _|_ __  ___| |_ __ _| | |"
  echo_with_color ${Yellow} "       | |_  | / __| ???_ \ \ / /| | ???_ | _ \   | || ???_ \/ __| __/ _??? | | |"
  echo_with_color ${Yellow} "       |  _| | \__ \ | | \ V / | | | | | | |  | || | | \__ \ || (_| | | |"
  echo_with_color ${Yellow} "       |_|   |_|___/_| |_|\_/  |_|_| |_| |_| |___|_| |_|___/\__\__,_|_|_|"
  echo "   "
  echo "   "
  echo_with_color ${Yellow} "							        Version : 1.0.2 Author : Zane Adams          "
  echo "  "
  echo "  "

  # check_requirements {{{
  check_requirements () {
    info "???????????? FishVim ????????????..."
    if hash "git" &>/dev/null; then
      git_version=$(git --version)
      success "?????? git ?????????${git_version}"
    else
      warn "???????????????git"
    fi
    if hash "vim" &>/dev/null; then
      is_vim8=$(vim --version | grep "Vi IMproved 8")
      is_vim74=$(vim --version | grep "Vi IMproved 7.4")
      if [ -n "$is_vim8" ]; then
        success "????????? Vim ??????: vim 8.0"
      elif [ -n "$is_vim74" ]; then
        success "????????? Vim ??????: vim 7.4"
      else
        if hash "nvim" &>/dev/null; then
          success "????????? Neovim ???????????????"
        else
          warn "SpaceVim ?????? Neovim ?????? vim 7.4 ???????????????"
        fi
      fi
      if hash "nvim" &>/dev/null; then
        success "Check Requirements: nvim"
        success "????????? Neovim ???????????????"
      fi
    else
      if hash "nvim" &>/dev/null; then
        success "????????? Neovim ???????????????"
      else
        warn "FishVim ?????? Neovim ?????? vim 7.4 ???????????????"
      fi
    fi
    info "??????????????????????????????..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh)"
  }

  # }}}

  # download_font {{{
  download_font () {
    url="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/${1// /%20}"
    path="$HOME/.local/share/fonts/$1"
    if [[ -f "$path" ]]
    then
      success "????????? $1"
    else
      info "???????????? $1"
      curl -s -o "$path" "$url"
      success "????????? $1"
    fi
  }

  # }}}

  # install_fonts {{{
  install_fonts () {
    if [[ ! -d "$HOME/.local/share/fonts" ]]; then
      mkdir -p $HOME/.local/share/fonts
    fi
    download_font "Sauce Code Pro Nerd Font Complete.ttf"
    info "????????????????????????????????????..."
    if [ $System == "Darwin" ];then
      if [ ! -e "$HOME/Library/Fonts" ];then
        mkdir "$HOME/Library/Fonts"
      fi
      cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
    else
      fc-cache -fv > /dev/null
      mkfontdir "$HOME/.local/share/fonts" > /dev/null
      mkfontscale "$HOME/.local/share/fonts" > /dev/null
    fi
    success "?????????????????????!"
  }

  # }}}

  read number
  echo "\033[36m :: \033[0m 4 ???????????????"
  echo "\033[35m 4 \033[0m \033[32m zane \033[0m \ nvim "
  echo "\033[35m 3 \033[0m \033[32m zane \033[0m \ vim "
  echo "\033[35m 2 \033[0m \033[32m zane \033[0m \ both "
  echo "\033[35m 1 \033[0m \033[32m zane \033[0m \ update "
  echo "\033[32m ==> \033[0m ???????????????: (??????: "1 2 3", "1-3", "^4" ???????????????)"
  echo "\033[32m ==> \033[0m $number"

  echo "  "
  echo " ?????????????????????????????? "
  mv -r "$HOME/.config/nvim ./vim_back"
  mv -r "$HOME/.vim" ./Vim_Back
  mv "$HOME/.vimrc" ./Vim_Back

  echo "  "
  echo ":: "
  if [ $number = "1" ]; then
    mkdir fishvim
    git clone https://github.com/Zane-two/FishVim ../fishvim
    mv ./fishvim/.vimrc "$HOME/"
    mv ./fishvim/.vim "$HOME/"
    mv ./fishvim/nvim "$HOME/.config"
  elif [ $number = "2" ]; then
    mv ./.vimrc "$HOME/"
    mv ./nvim "$HOME/.config"
  elif [ $number = "3" ]; then
    mv ./.vimrc "$HOME/"
  elif [ $number = "4" ]; then
    mv ./nvim "$HOME/.config/"
  else 
    echo ":: ??????????????????????????????????????????"

  install_done () {
    echo_with_color ${Yellow} ""
    echo_with_color ${Yellow} "???????????????!"
    echo_with_color ${Yellow} "=============================================================================="
    echo_with_color ${Yellow} "==               ?????? Vim ??? Neovim?????????????????????????????????                   =="
    echo_with_color ${Yellow} "=============================================================================="
    echo_with_color ${Yellow} ""
    echo_with_color ${Yellow} "???????????? FishVim??????????????????"
    echo_with_color ${Yellow} ""
  }

  echo "???????????????"
  read
  exit 0

else
echo "-----???????????????????????????"
read
exit
fi
#####
