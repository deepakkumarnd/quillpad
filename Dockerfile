FROM deepakumarnd/quillpad:v1.0
MAINTAINER Deepak Kumar <deepakkumarnd@gmail.com>

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN bundle config --global frozen 1 && bundle install --jobs 4 --deployment --without development test


