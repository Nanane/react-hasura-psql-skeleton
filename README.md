### React Postgres Hasura Skeleton

This is my personal skeleton for building apps as of 2021.

## Requirements
* `git`
* `docker`
* `docker-compose`

## Setup

* fork the repository
* run `./scripts/init-project.sh`
* you will be asked configuration options, everything is required
* Once it's done, you can already start your project by running `docker-compose up -d`
* You will be able to access your frontend app and hasura console through the ports you will have configured via `http://localhost:{port}`


# Reverse proxy

In order to access your website through regular DNS addresses, you need to setup a reverse proxy.
I usually use NGINX, as it is easy to configure and maintain.

For this purpose, I use `./scripts/add-reverse-proxy.sh` which copies the nginx template configuration file