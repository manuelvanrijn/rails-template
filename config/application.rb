# set supported languages and log formatter
insert_into_file 'config/application.rb', after: "class Application < Rails::Application\n" do
  <<-RUBY
    # set timezone used in the interface
    config.time_zone = 'Amsterdam'
  RUBY
end
