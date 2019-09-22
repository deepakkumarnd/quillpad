FROM ruby:2.6.1
MAINTAINER Deepak Kumar <deepakkumarnd@gmail.com>

ENV APP_ROOT /usr/src/app
ENV BUNDLE_PATH /usr/local/bundle
ENV PORT=80

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libxml2-dev libxslt1-dev apt-utils

RUN mkdir -p /usr/src/app
