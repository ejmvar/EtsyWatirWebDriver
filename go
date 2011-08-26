#!/bin/bash -e
source "$HOME/.rvm/scripts/rvm"
# Use the correct ruby
[[ -s ".rvmrc" ]] && source .rvmrc
bundle install
cucumber -p ci