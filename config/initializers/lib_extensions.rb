# Load extensions from lib/extensions
Dir[Rails.root.join('lib', 'extensions', '*.rb')].each { |l| require l }
