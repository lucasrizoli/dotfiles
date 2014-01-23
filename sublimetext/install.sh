#!/bin/bash
# Sublime settings

[[ $(uname -s) == "Darwin" ]] && alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

SUBL_OSX_USER_DIRECTORY="$HOME/Library/Application\ Support/Sublime\ Text/Packages/User"
printf "$SUBL_OSX_USER_DIRECTORY\n"