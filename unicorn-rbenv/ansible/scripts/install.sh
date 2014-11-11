#!/bin/bash

################################################################################
#                                                                              #
# WARNING: Functional but not used at the moment. Written for experiments      #
#                                                                              #
################################################################################

# Prepare rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/$1/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/$1/.bash_profile

# Reload profile
# source ~/.bash_profile

su -l $1 -c /bin/bash <<EOF
  # Clone rbenv stuff
  git clone https://github.com/sstephenson/rbenv.git /home/$1/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git /home/$1/.rbenv/plugins/ruby-build

  # Go to the application directory
  cd $2

  # Install ruby at the application ruby verison and install bundler
  rbenv install
  ~/.rbenv/shims/gem install bundler

  # Prepare rails for prod
  export RAILS_ENV=production

  # Install the gems
  bundle install --deployment --without test development

  # Precompile the assets
  bundle exec rake assets:precompile
EOF
