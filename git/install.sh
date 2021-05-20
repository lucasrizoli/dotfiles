#!/bin/bash
# Set up global Git preferences
# From http://augustl.com/blog/2009/global_gitignores/

	git config --global core.excludesfile .gitignore
fi

# Configure Git on OS X to properly handle line endings
# https://help.github.com/articles/dealing-with-line-endings/
if [[ $(uname -s) == "Darwin" ]]; then
	git config --global core.autocrlf input
fi
