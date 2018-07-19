#!/bin/bash -x
lspci -k | grep -A 5 VGA
lsmod  | grep nouveu
# show whether monitor is enabled . adopted from src https://askubuntu.com/questions/121014/how-do-i-list-connected-displays-using-the-command-line
xrandr --listmonitors
