#!/bin/bash -x
source ~/.bash_profile
# Use the correct ruby
[[ -s ".rvmrc" ]] && source .rvmrc
bundle install
cucumber -p ci