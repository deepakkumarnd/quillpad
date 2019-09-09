FROM ruby:2.4.6
MAINTAINER Deepak Kumar <deepakkumarnd@gmail.com>

ENV APP_ROOT /usr/src/app
ENV BUNDLE_PATH /usr/local/bundle
ENV PORT=80

# ENV DATABASE_URL localhost
# ENV QUILLPAD_DATABASE_PASSWORD password goes here

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libxml2-dev libxslt1-dev apt-utils

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN bundle config --global frozen 1 && bundle install --jobs 4 --deployment --without development test


