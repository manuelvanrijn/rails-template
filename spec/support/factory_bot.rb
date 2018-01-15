RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      # Test factories in spec/factories are working.
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

# Suggested docs
# --------------
# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md
# https://github.com/thoughtbot/factory_girl/wiki/Example-factories.rb-file
