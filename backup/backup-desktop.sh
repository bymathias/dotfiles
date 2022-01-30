#!/usr/bin/env bash

# echo "/home/$USER"

# echo $ROOT

rsync-tmbackup "/home/$USER" "/media/bm/MBBK/backup-desktop/home" backup-desktop_excluded.txt
