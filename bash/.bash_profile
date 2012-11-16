# .bash_profile executes in login shell

# If current shell is interactive and there's a .bashrc, execute .bashrc
[[ $- == *i* ]] && [ -f ~/.bashrc ] && source ~/.bashrc

## TODO why use [ -n "$PS1" ] and not [[ $- == *i* ]]?