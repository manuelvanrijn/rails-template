# set default timezone to NL
gsub_file 'config/application.rb',
          "# config.time_zone = 'Central Time (US & Canada)'",
          "config.time_zone = 'Amsterdam'"

# set default local to NL
gsub_file 'config/application.rb',
          '# config.i18n.default_locale = :de',
          'config.i18n.default_locale = :nl'

# set supported languages and log formatter
insert_into_file 'config/application.rb', after: "config.i18n.default_locale = :nl\n" do
  <<-'RUBY'

    # supported locales
    config.i18n.available_locales = [:nl, :en]

    # use the rails log formatter for when calling Rails.logger
    config.log_formatter = ::Logger::Formatter.new
  RUBY
end
