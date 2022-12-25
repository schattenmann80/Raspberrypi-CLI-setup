#!/bin/bash

read -p "Input your name: " name
read -p "Input your email: " email

git config --global user.name "$name"
git config --global user.email "$email"

echo "Create bin and obj dir in home directory ?" 
select yn in "Y" "N"; do
	case $yn in
		[Yy]* ) cd; mkdir bin; mkdir obj; break;;
		[Nn]* ) break;;
		* ) echo "Wrong answer: $yn -> select 1 or 2";;
	esac
done

cd
echo "alias l='ls -l'" >> .bashrc
echo "alias vm='vi [mM]akefile'" >> .bashrc
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
echo "set tags=tags;/" >> .vimrc 
echo "highlight Comment ctermfg=lightblue" >> .vimrc 

