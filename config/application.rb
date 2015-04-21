# set default timezone to NL
gsub_file 'config/application.rb',
          "# config.time_zone = 'Central Time (US & Canada)'",
          "config.time_zone = 'Amsterdam'"

# set default local to NL
gsub_file 'config/application.rb',
          '# config.i18n.default_locale = :de',
          'config.i18n.default_locale = :nl'

# set supported languages
insert_into_file 'config/application.rb', after: /^*i18n.default_locale*\n\n/ do
  <<-'RUBY'
    # supported locales
    config.i18n.available_locales = [:nl, :en]

  RUBY
end
