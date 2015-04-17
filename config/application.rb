# set default timezone to NL
gsub_file 'config/application.rb',
          "# config.time_zone = 'Central Time (US & Canada)'",
          "config.time_zone = 'Amsterdam'"

# set default local to nl
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

insert_into_file 'config/application.rb', before: /^  end/ do
  <<-'RUBY'

    # Ensure non-standard paths are eager-loaded
    config.eager_load_paths += ["#{config.root}/app/workers"]

    # Skip some generators
    config.generators do |generate|
      generate.helper false
      generate.view_specs false
      generate.routing_specs false
      generate.request_specs false
      generate.javascript_engine false
      generate.stylesheets false
      # generate.jbuilder false
    end
  RUBY
end
