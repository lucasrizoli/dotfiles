#!/bin/bash
# Set up Bash preferences

is_verbose=true
is_dry_run=printf
target_directory="$HOME"
files_to_ignore=(.aliases .functions .path install.sh)
backup_suffix=".backup-$(date +'%Y%m%d-%H%M%S')"

# loop over files in the present directory
for f in $(find . -type f); do
  file="${f#./}"    # get rid of the './' that find prefixes to files

  # skip over ignored files
  for ignored in "${files_to_ignore[@]}"; do
    [[ "$file" = "$ignored" ]] && continue 2
  done

  # check for existing symlinks
  if [[ -L "$target_directory/$file" ]]; then
    if [[ "$target_directory/$file" -ef "$file" ]]; then
      $is_verbose && printf "$file in $target_directory already linked to $file\n"
      continue
    else
      $is_verbose && printf "$file in $target_directory linked to $(readlink $target_directory/$file)\n"
    fi
  fi

  # check for existing files
  if [[ -f "$target_directory/$file" ]]; then
    $is_verbose && printf "$file in $target_directory already exists\n"
    if diff -rq "$source_dir/$file" "$target_dir/$file" > /dev/null 2>&1; then
      $is_verbose && printf "$file in $target_directory the same as $file\n"
      continue
    else
      $is_verbose && printf "$file in $target_directory differs from $file\n"
      $is_dry_run mv "$target_directory/$file" "$target_directory/$file$backup_suffix"
    fi
  fi

  printf "$file\n"
done