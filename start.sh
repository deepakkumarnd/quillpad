#!/usr/bin/bash

source /home/deploy/quillpad/.env
cd /home/deploy/quillpad/current && bundle exec puma -C config/puma.rb