#!/bin/bash

# Test for root user.
if [ "$USER" != "root" ]; then
	echo "Script is not running as root"
	exit -1
fi


apt update
apt upgrade
apt dist-upgrade

apt-get --assume-yes install vim universal-ctags cmake

cd
echo "alias l='ls -l'" >> .bashrc
echo "export PATH=\$PATH:/home/pi/bin" >> .bashrc

echo "set nocompatible" >> .vimrc
echo "syntax on"  >> .vimrc
echo "inoremap <Esc>Oq 1" >> .vimrc
echo "inoremap <Esc>Or 2" >> .vimrc
echo "inoremap <Esc>Os 3" >> .vimrc
echo "inoremap <Esc>Ot 4" >> .vimrc
echo "inoremap <Esc>Ou 5" >> .vimrc
echo "inoremap <Esc>Ov 6" >> .vimrc
echo "inoremap <Esc>Ow 7" >> .vimrc
echo "inoremap <Esc>Ox 8" >> .vimrc
echo "inoremap <Esc>Oy 9" >> .vimrc
echo "inoremap <Esc>Op 0" >> .vimrc
echo "inoremap <Esc>On ." >> .vimrc
echo "inoremap <Esc>OQ /" >> .vimrc
echo "inoremap <Esc>OR *" >> .vimrc
echo "inoremap <Esc>Ol +" >> .vimrc
echo "inoremap <Esc>OS -" >> .vimrc
echo "inoremap <Esc>OM <Enter>" >> .vimrc
echo "set hlsearch" >> .vimrc
echo "highlight Comment ctermfg=lightblue" >> .vimrc
echo "set tags=tags;/" >> .vimrc

echo '"\e[6~": history-search-forward' >> /etc/inputrc
echo '"\e[5~": history-search-backward' >> /etc/inputrc


echo '*               soft    core            unlimited' >> /etc/security/limits.conf

echo "reboot ?" 
select yn in "Y" "N"; do
	case $yn in
		[Yy]* ) reboot;;
		[Nn]* ) break;;
		* ) echo "Wrong answer: $yn -> select 1 or 2";;
	esac
done
