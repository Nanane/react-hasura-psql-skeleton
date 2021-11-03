### React Postgres Hasura Skeleton

This is my personal skeleton for building apps as of 2021.
It builds a fresh frontend app and a postgres database, on top of which I personally enjoy adding an hasura console

## Requirements
* `git`
* `docker` + `docker-compose`
* `nvm` + `node16`
* an hasura cloud account

## Setup

* fork the repository
* run `./scripts/init-env.sh`
* you will be asked configuration options, everything is required
* Once it's done, you can already start your project by running `docker-compose up -d`
* You will be able to access your frontend app through the ports you will have configured via `http://localhost:{port}`

# Reverse proxy

In order to access your website through regular DNS addresses, you need to setup a reverse proxy.
I usually use NGINX, as it is easy to configure and maintain.

For this purpose, I use `./scripts/add-reverse-proxy.sh` which copies the nginx template configuration file