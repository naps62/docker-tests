#!/bin/bash
cd /var/www/app1
bundle exec unicorn -c config/unicorn.rb -E production -D
nginx
