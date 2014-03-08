#!/bin/zsh

# Variables
# ----------------------------------------------

# echo `cat /home/niklas/bin/history.sh | sed "s/: [0-9]*:[0-9];//g"` > /tmp/.zsh-sorted-data
# duplicates=`sort $raw_data | uniq -d`
(cat /home/niklas/bin/history.sh | sed "s/: [0-9]*:[0-9];//g") > /tmp/zsh-history
(cat /tmp/zsh-history | grep "s/cd [.]*//g") > /tmp/zsh-history

rm /tmp/zsh-history

# Code
# ----------------------------------------------


#: 1388423935:0;cp -P .zsh_history ~/bin/filterkaffee.sh
