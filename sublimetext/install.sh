#!/bin/bash
# Sublime settings

[[ $(uname -s) == "Darwin" ]] && alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

echo Creating symlink
ln -sf $(pwd)/Preferences.sublime-settings $HOME'/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings'