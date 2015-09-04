#!/bin/bash
cd /var/www/test
bundle exec unicorn -c config/unicorn/production.rb -E production -D
nginx
