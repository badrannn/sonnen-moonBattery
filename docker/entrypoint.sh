#!/bin/bash 
set -e
rm -f tmp/pids/server.pid

echo "Running migrations"
bin/rails db:migrate RAILS_ENV=development
  
echo "Starting server"
bundle exec rails s -p 3000 -b '0.0.0.0'
