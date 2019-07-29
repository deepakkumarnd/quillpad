#!/usr/bin/bash
# This script is used to start puma application server.

source $HOME/.env
cd $HOME/quillpad/current && bundle exec puma -C config/puma.rb