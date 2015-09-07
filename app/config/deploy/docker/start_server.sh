#!/bin/bash

echo 'starting app'
cd /var/www/app
bundle exec unicorn -c config/deploy/docker/unicorn.rb -E production -D
nginx
