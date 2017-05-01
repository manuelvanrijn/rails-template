# Rails template with variants

Simple template to bootstrap the stuff I always use (and some variants I might need) in a new Rails project.

## Prerequisites

This template currently works with:

Rails 5
MySQL

## Usage

```
$ gem install rails -v 5.0.0
$ rails new <project_name>\
  -TB\
  -d mysql\
  --webpack\
  -m https://raw.githubusercontent.com/manuelvanrijn/rails-template/master/template.rb
```

### libv8 errors?

```
bundle config build.libv8 --with-system-v8
```

### Install template as default for rails new

_Optional step_

Create a `~/.railsrc` file with these contents:

```
-TB
-d mysql
-m https://raw.githubusercontent.com/manuelvanrijn/rails-template/master/template.rb
```

## What's included by default

* Setup git master and develop branch structure
* HAML instead of ERB
* Foreman to bootup rails (and other dependent processes) for development
* Airbrake (errbit) for error handling and capistrano deployment hooks
* Capistrano for deployment with two environments (production, staging)
* Production configuration for nginx
* Letter opener to handle mail sends for development and test
* Version number helpers. Include the tag version of the current deploy in the layout as comment
* Seperate localizations for views and models
* Sets the default language to dutch (nl)
* ERD rake task
* RuboCop
* dotenv for managing environment variables
* RSpec as test suite with:
  * SimpleCov for code coverage
  * FactoryGirl
  * Database cleaner
  * Capybara for integration/headless-browser tests
  * shoulda-matchers
  * time_helper
  * rake task helper
* Beter scaffold templates
* Bower-Rails for frontend dependecy managment
* Font-Awesome
* Model validators:
  * E-Mail
* And some handy development gems:
  * binding.pry
  * better_errors - the name says it all
  * letter_opener - open mails in the browser
  * bullet - to detect N+1 queries

## Variants

During the generation the template will ask you if you want to include some variants. Here's a list with the current variants supported

### Styling: Twitter bootstrap

* Adds [Twitter Bootstrap sass](https://github.com/twbs/bootstrap-sass)
* Adds [bootstrap_form](https://github.com/bootstrap-ruby/rails-bootstrap-forms) as `form_helper` to easy create Bootstrap styled forms
* Modifies scaffold templates to generate `bootstrap_form` templates

### Authentication/Authorization: Sorcery + cancancan

* Adds [sorcery](https://github.com/NoamB/sorcery) for authentication
* Adds [cancancan](https://github.com/CanCanCommunity/cancancan) for authorization
* Adds a `User` model with some basic rspec's
* Adds a `UserSessionsController` to handle login/logout
* Adds a basic `Ability` file
* Adds a seed for a `admin` user
* Modifies the `HomeController` to require a authenticated user
* Modifies the `layouts/application` to include a logout and username in the topbbar
* Modifies scaffold controllers to require an authenticated user and [cancancan's](https://github.com/CanCanCommunity/cancancan) `load_and_authorize_resources`
* Modifies scaffold templates to generate `bootstrap_form` templates

### Pagination/Search: Ransack + kaminari

* Adds [ransack](https://github.com/activerecord-hackery/ransack) for searching and ordering results
* Adds [kaminari](https://github.com/amatsuda/kaminari) for pagination
* If choosen for variant Twitter Bootstrap, the application helper is modified to use a [Twitter Bootstrap styled pagination component](https://github.com/matenia/bootstrap-kaminari-views)
* Modifies scaffold templates to include a search field and ordering on the columns of a `index` view
* Adds localization file with the translations used by [kaminari](https://github.com/amatsuda/kaminari)

### Sidekiq for background jobs

* Adds [sidekiq](http://sidekiq.org/)
* Adds [sidekiq-statistic](https://github.com/davydovanton/sidekiq-statistic)
* Adds `redis-server` and `sidekiq` to start with `foreman`
* Adds two `ENV` variables for the basic authentication on `/sidekiq` for monitoring
* Extends `simplecov` to group `Workers`
