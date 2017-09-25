#!/bin/bash

# Set the colours you can use
black='\033[1;30m'
white='\033[1;37m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[1;35m'
cyan='\033[1;36m'
pink='\e[1;31m'
endcolor='\e[0m'

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#         STARTING SYSTEM CONFIG SCRIPT      #"
echo -e $cyan"##############################################"
echo ""
echo -e $cyan"Are you ready $yellow?$endcolor"

select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo -e $cyan "\nGood bye my friend ;( \n" $endcolor; exit 1;;
    *) echo -e $red "Answer must be$blue 1 or$blue 2 " $endcolor
  esac
done

echo ""
echo -e "$cyan Checking your system for update & cleaning up$endcolor"
echo ""
echo -e "$pink"
sudo apt-get update -y && echo "" && \
sudo apt-get dist-upgrade -y && echo "" && \
sudo apt-get upgrade -y && echo "" && \
sudo apt-get autoremove -y && echo "" && \
sudo apt-get autoclean -y && echo "" && \
echo ""
echo -e $cyan"Update Done!"$endcolor
sudo clear

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#        STARTING APPLICATION INSTALLER      #"
echo -e $cyan"##############################################"
echo ""

# Install ppa's if is not already Installed
echo -e "$pink"
if test ! $(which software-properties-common); then
  	echo -e "INSTALLING PPA'S SUPPORT... \n"
  	sudo apt install -y software-properties-common software-properties-gtk
    echo -e ""
fi

echo -e "$pink"
if test ! $(which amd64-microcode); then #intel-microcode
  	echo -e "INSTALLING PROCESSOR DRIVERS... \n"
  	sudo apt install -y amd64-microcode
    echo -e ""
fi

if test ! $(which gdebi); then
  	echo -e "INSTALLING gdebi APPLICATION... \n"
  	sudo apt install -y gdebi
    echo -e ""
fi

if test ! $(which libreoffice); then
  	echo -e "INSTALLING libreoffice APPLICATION... \n"
  	sudo add-apt-repository ppa:libreoffice/ppa
    #sudo apt update
    sudo apt install -y libreoffice libreoffice-templates libreoffice-style-elementary libreoffice-l10n-es myspell-es hyphen-es
    sudo apt install -y ttf-mscorefonts-installer
    echo -e ""
fi

if test ! $(which elementary-tweaks); then
  	echo -e "INSTALLING Elementary-tweaks APPLICATION... \n"
  	sudo add-apt-repository ppa:philip.scott/elementary-tweaks 
    #sudo apt-get update
    sudo apt-get install elementary-tweaks
    echo -e ""
fi

# ----------------------------------------------------------------------
# | Install apps                                                       |
# ----------------------------------------------------------------------
echo -e "Installing chromium-browser..."
sudo apt install -y chromium-browser
echo -e "Installing firefox-browser..."
sudo apt install -y firefox
echo -e "Installing google-chrome-browser..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg –i google-chrome-stable_current_amd64.deb
#sudo apt install -y google-chrome-stable
echo -e "Installing Git-core"
sudo apt install -y git-core
echo -e "Installing NodeJS & NPM"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
echo -e "Installing Atom Text-Editor"
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install -y atom
# .. other apps