#!/bin/bash

echo "     _ _     _                _     "
echo " ___(_) |_  | |__   __ _  ___| | __ "
echo "/ __| | __| | '_ \ / _\` |/ __| |/ /"
echo "\__ \ | |_  | |_) | (_| | (__|   <  "
echo "|___/_|\__| |_.__/ \__,_|\___|_|\_\ "
echo "                                    "
echo -e "--------------------------------------\n"

help_and_die () {
    echo -e ">> usage: bootstrap <link|packages>"
    exit
}

if [ ! $# == 1 ]; then
    help_and_die
fi

if [ $1 == "link" ]; then
    echo -e ">> Setting up symlinks\n"
    to_stow=( conkeror fish git matplotlib scripts redshift theano )
    for dir in ${to_stow[@]}; do
        stow -t ~/ $dir
    done
elif [ $1 == "packages" ]; then
    cd ./packages
    bash ./setup.sh
    cd ..

    echo ">> Setting fish as default shell"
    chsh -s $(which fish)
else
    help_and_die
fi