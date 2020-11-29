# Challenge - Italo Menna Silveira
## The Application

The application has two models to model the solution where one is used for questions and the other for accesses. There are two screens that are used to show the two requested features:
* Disciplines with most accessed questions in the last 24 hours, on `/questions`;
* Questions most accessed by period, on `/question_accesses`.

## Requirements
* Docker version 19.03.13
* docker-compose version 1.25.4

## Added Gems On Project
* Activerecord-import - for insert a large amount of data in the base;
* Bootstrap - for make small changes in the front end;
* Bootstrap-datepicker - for select a range of dates;
* DatabaseCleaner - for cleaner database after tests;
* Factory Bot - for create factories to tests;
* Faker - for create data fake;
* i18n - for internacionalization of application;
* JQuery - for manipulation of DOM;
* Kaminari - for pagination on front end;
* RSpec - for suite of tests;
* Rubocop - for check the style guide;
* Shoulda Callback Matchers - for tests with callbacks on model test;
* Shoulda Matchers - for tests relation on model test.

## Run Project
On project folder run this command to build application:

```
docker-compose build
```

Run this command to up containers with database and web application:
```
docker-compose up
```

To run tests:
```
docker-compose exec rails bundle exec rspec
```
