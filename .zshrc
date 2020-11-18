# Bless https://scriptingosx.com/2019/06/moving-to-zsh/

# Keep a history of zsh commands
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
SAVEHIST=5000
HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Case-insensitive globbin'
setopt NO_CASE_GLOB

# Enter in the cd when I do .. or etc.
setopt AUTO_CD

# Correct my edit distance 1-2 typos
setopt CORRECT
setopt CORRECT_ALL

# Load and execute shell dotfiles
# * .path extends `$PATH`
# * .aliases adds common aliases
# * .functions adds functions
# * .bash_prompt makes the prompt fancy
for file in .{path,aliases,functions,zsh_prompt}; do
  [[ -r "$file" ]] && source "$file"
done
unset file