FROM ruby:2.6.1
MAINTAINER Deepak Kumar <deepakkumarnd@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libxml2-dev libxslt1-dev apt-utils

ENV APP_ROOT /usr/src/app
RUN mkdir -p APP_ROOT
WORKDIR /usr/src/app
ENV BUNDLE_PATH /usr/local/bundle
COPY Gemfile* $APP_ROOT/
RUN bundle config --global frozen 1 && bundle install


ENV PORT=80
ENV PG_USER_PASSWORD=q1w2e3r4

COPY . $APP_ROOT/
