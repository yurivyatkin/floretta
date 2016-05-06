Floretta on Rails
=================


Overview
--------

This project is concerned with creating a new version of
[Floretta](https://www.floretta.co.nz). 

For the details please see
[Wiki](https://github.com/yurivyatkin/floretta/wiki).

Using Docker
------------

[Docker](www.docker.com) can be used to create a development environment
for this project.

Settings for Docker use the standard postrgesql container, so make sure that
"config/database.yml" is ready for that.
The following minimal example will work:

```yaml
default: &default 
  adapter: postgresql 
  encoding: unicode 
  pool: 5 
  timeout: 5000 
  username: postgres 
  host: postgres
  port: 5432

development: 
  <<: *default 
  database: app_development

test: 
  <<: *default 
  database: app_test

```

Having installed Docker Composer, one can deploy the project locally
with the following sequence of commands, 
issued in the root directory of the project:

```shell
docker-compose build
docker-compose up
docker-compose run app rake db:create
docker-compose run app rake db:migrate
docker-compose run app rake shoppe:setup

```

Pressing `Ctrl+C` will stop the containers.

It is better to run `docker-compose` commands in a separate terminal (window).

To start the project again, just run `docker-compose up`. 

The Docker settings for this project were influenced by 
[Running a Rails Development Environment in Docker]
(https://blog.codeship.com/running-rails-development-environment-docker/).

