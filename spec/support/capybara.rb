require 'capybara/rails'
require 'capybara/rspec'

# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# The following lines will tell Capybara to use Chrome instead of Firefox,
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Suggested docs
# --------------
# http://www.rubydoc.info/github/jnicklas/capybara/master
# Cheatsheet: https://gist.github.com/zhengjia/428105
# Capybara matchers: http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers
