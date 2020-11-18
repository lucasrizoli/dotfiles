#!/bin/bash
# Set up Bash preferences
# Skimmed https://github.com/janmoesen/tilde/blob/master/install.sh
# and took what I could understand, more or less

is_verbose=true;
is_dry_run=false;
dry_run=;
target_directory="$HOME";
files_to_ignore=(install.sh);
backup_suffix=".backup-$(date +'%Y%m%d-%H%M%S')";
source_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; # http://stackoverflow.com/a/246128/493944

if [ "$is_dry_run" = "true" ]; then
  dry_run=echo;
  printf "Dry run: no changes will be made.\n";
fi

# loop over files in the present directory
for f in $(find . -type f); do
  file="${f#./}";    # get rid of the './' that find prefixes to files

  # skip over ignored files
  for ignored in "${files_to_ignore[@]}"; do
    [[ "$file" = "$ignored" ]] && continue 2;
  done

  # check for existing symlinks
  if [[ -L "$target_directory/$file" ]]; then
    if [[ "$target_directory/$file" -ef "$file" ]]; then
      $is_verbose && printf "$file in $target_directory already linked to $file\n";
      continue
    else
      $is_verbose && printf "$file in $target_directory linked to $(readlink $target_directory/$file)\n";
    fi
  fi

  # check for existing files
  if [[ -f "$target_directory/$file" ]]; then
    $is_verbose && printf "$file in $target_directory already exists\n";
    if diff -rq "$source_dir/$file" "$target_dir/$file" > /dev/null 2>&1; then
      $is_verbose && printf "$file in $target_directory the same as $file\n";
      continue
    else
      $is_verbose && printf "$file in $target_directory differs from $file\n";
      $dry_run mv "$target_directory/$file" "$target_directory/$file$backup_suffix";
    fi
  fi

  # symlink the files
  $is_verbose && printf "Linking $target_directory/$file to $source_directory/$file\n";
  $dry_run ln -vs "$source_directory/$file" "$target_directory/$file";
done

$is_verbose && printf "Done.\n";