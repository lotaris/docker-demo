#!/bin/bash

# Prepare rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/$1/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/$1/.bash_profile
