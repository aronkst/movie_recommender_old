# Movie Recommender

This is a movie recommendation project, using the Ruby programming language, the Rails framework, the PostgreSQL and Redis databases, and various libraries such as Nokogiri, Sidekiq, RuboCop and RubyCritic.

A Crawler is used to fetch information from movies on IMDb.

The rating of the recommended movies works with a calculation involving the note you gave the movie along with the IMDb rating.

**THIS PROJECT IS UNDER DEVELOPMENT.**

## Ruby version

2.6

## Rails version
5.2

## System dependencies

- Ruby
- Rails
- PostgreSQL
- Redis
- Nokogiri
- Sidekiq
- RuboCop
- RubyCritic
- Brakeman

## Configuration

Use the Bundle to install the Gems.

`bundle install`

## Database creation

Use the commands:

`rails db:create`

`rails db:migrate`

## How to run the test suite

**NOT ALL TESTS HAVE BEEN DEVELOPED YET.**

To run the tests, use the following command:

`rails t`

## Run the application

To run the application use the command:

`rails s`

And also execute the command below to start Sidekiq:

`bundle exec sidekiq -q default -c 8`
