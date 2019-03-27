#!/usr/bin/bash

source $HOME/.env
cd $HOME/quillpad/current && bundle exec puma -C config/puma.rb