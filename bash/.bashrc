#!/bin/bash
# .bashrc executes in non-login shell

# Load and execute shell dotfiles
# * .path extends `$PATH`
# * .aliases adds common aliases
# * .functions adds functions
# * .bash_prompt makes the prompt fancy
for file in .{path,aliases,functions,bash_prompt}; do
	[[ -r "$file" ]] && source "$file"
done
unset file

# Enable, when available
# * nocaseglob: case-insensitive globbing (used in pathname expansion)
# * cdspell: autocorrect typos in path names when using `cd`
# * no_empty_cmd_completion: disable autocomplete on empty lines
for option in "nocaseglob" "cdspell" "no_empty_cmd_completion"; do
	shopt -s "$option" 2> /dev/null
done
unset option

# Prefer Canadian English and use UTF-8
export LC_ALL="en_CA.UTF-8"
export LANG="en_CA"
export LANGUAGE="en"

# Exclude certain commands from the history
# Note: some aliases may also be ignored; see .aliases
export HISTIGNORE="pwd:exit:date:* --help:clear:man *:ls:ls *:$HISTIGNORE"

# Exclude duplicate commands from history
export HISTCONTROL=ignoredups

# Maintain a long history of commands
export HISTSIZE=4096

# Keep a longer history in the history file, which can be searched
export HISTFILESIZE=16384

# Store date & time of commands in the history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S$  "