#!/usr/bin/env sh
# This script is used to deploy the application on the server.

# Run tests
COVERAGE=true bundle exec rspec spec
# Deploy to production
bundle exec cap production deploy
# Do health checks on each servers
bundle exec cap production health_check
# Do health check from build machine
curl -ks https://$MY_SRV/status | jq
