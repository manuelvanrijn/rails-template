# My Rails template

Simple template to bootstrap the stuff I always use in a new project

## Prerequisites

1. It's always clever to have the lastest rails version running when rails new (`gem update rails`)
2. If you plan to use (and you should) `bower-rails` you need the following:
  * nodejs
  * npm
  * package: bower (`npm install -g bower`)

## Usage

```
cd /code/some-path
git clone git@github.com:manuelvanrijn/rails-template.git
rails new <insert-app-name> -TB -d mysql -m /code/some-path/rails-template/template.rb
```

Running the above command will ask you a few questions:

```
Do you want to include "errbit"? (y/n)
  errbit host? (ex: errbit.example.com):
  errbit host uses ssl? (y/n)
  errbit API key for this project?
Do you want to include "twitter bootstrap"? (y/n)
Do you want to include "bower-rails"? (y/n)
Do you want to include "capistrano"? (y/n)
```

## What's included

* Setup git master and develop branch structure
* HAML instead of ERB
* Airbrake (errbit) for error handling and capistrano deployment hooks
* Capistrano for deployment
* RSpec as test suite with:
  * SimpleCov for code coverage
  * FactoryGirl
  * Database cleaner
  * shoulda-matchers
* Bower-Rails for frontend dependecy managment
* Twitter Bootstrap with Font-Awesome
* And some handy development gems:
  * better_errors - the name says it all
  * quiet_assets - remove's log requests for js, css etc. so we can focus on the real requests
  * letter_opener - open mails in the browser
  * bullet - to detect N+1 queries
