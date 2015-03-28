# Example Lotus blog application [![Build Status](https://travis-ci.org/avdgaag/lotus-demo.svg?branch=master)](https://travis-ci.org/avdgaag/lotus-demo)

## Introduction

This is a very simple Lotus example application to demonstrate the basics of the
[Lotus][] web framework. It contains the following concepts:

1. Routing
2. Repositories, entities and mapping
3. Flash
4. Parameter whitelisting and validation
5. Reading and writing data to a repository
6. Testing with Minitest
7. Database migrations

For a guide walking you through this application, see [http://arjanvandergaag.nl/blog/up-and-running-with-lotus.html](http://arjanvandergaag.nl/blog/up-and-running-with-lotus.html).

## Setup

Running this application locally is simple. First, make sure you have a working
installtion of Ruby (version 2 or later) and Rubygems on your system. Then,
clone the repository:

    % git clone git@github.com:avdgaag/lotus-blog-demo.git

Use [Bundler][] to install required aubygems dependencies:

    % bundle install

Make sure you have a database to work with. The application comes configured to
look for a [PostgreSQL][] database called `demo_development`. You can change
this configuration in `config/.env.development`. To create the database,
assuming you have `postgres` running:

    % createdb demo_development

Run the database migrations to set up the database schema:

    % bin/sequel -m db/migrations postgres://localhost/demo_development

You might also want to create some records using whatever database tools you
like.

To see the results, launch a web server:

    % bin/lotus server

And see the results at http://localhost:2300.

## Running the tests

Assuming you have the development server set up, all you need now is a test
database. The project comes preconfigured to look for a [PostgreSQL][] database
called `demo_test`, but this can be changed in `config/.env.test`.

Set up the test database:

    % createdb demo_test
    % bin/sequel -m db/mgirations postgres://localhost/demo_test

You can now run the test suite with [Rake][]:

    % rake spec

You should see the test results now.

[Lotus]: http://lotusrb.org
[Bundler]: http://bundler.io
[PostgreSQL]: http://www.postgresql.org
[Rake]: https://github.com/ruby/rake
