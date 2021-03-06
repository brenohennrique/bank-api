#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /bank_api/tmp/pids/server.pid

bundle exec rake db:create db:migrate
bundle exec rails s -b 0.0.0.0

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
