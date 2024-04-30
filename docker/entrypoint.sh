#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle check || bundle install
bundle exec rails db:prepare
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s -b 0.0.0.0 -p "${PORT}"
