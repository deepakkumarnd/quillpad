#!/usr/bin/env sh

# Run tests
bundle exec rspec spec
# Deploy to production
bundle exec cap production deploy
# Do health check
curl -ks https://$MY_SRV/status | jq