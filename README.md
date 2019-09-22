# README

Quillpad started as my personal hobby blogging project. I was using [jekyl](https://jekyllrb.com/) for my personal blog before and I was totally satisfied with that. But later I have developed an urge to make a markdown based blogging app myself. I quickly set it up using Rails framework but after doing that I wasn't able to spend enough time to it. But somehow I kept the fire buring and recently I am spending few hours on a weekly basis.

## What I wanted to build ?

1. A simple markdown based blogging app.

2. Ability to add different kinds of post such as encrypted posts, bookmarks.

3. Ability to provide content backup on per user basis.

4. A good experience which is simple for anyone to adapt.

5. A simple and looking blog.

## Build base image

docker build -f Base.dockerfile  -t deepakumarnd/quillpad:v1.0 . --force-rm

## Build application

docker build -t quillpad:v1.0 . --force-rm

## Updates

1. Migrated the application to rails 6.0.0
