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

if test ! $(which htop); then
  	echo -e "INSTALLING HTOP APPLICATION... \n"
  	sudo apt install -y htop
    echo -e ""
fi

# ----------------------------------------------------------------------
# | Update sources                                                     |
# ----------------------------------------------------------------------

#sudo apt update


# ----------------------------------------------------------------------
# | Install apps                                                       |
# ----------------------------------------------------------------------

# .. other apps