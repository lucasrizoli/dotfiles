#!/bin/bash
# .bash_profile executes in login shell

# If current shell is interactive and there's a .bashrc, execute .bashrc
[[ $- == *i* ]] && [[ -r .bashrc ]] && source .bashrc;