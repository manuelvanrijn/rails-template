def say_recipe(name); say "\033[1m\033[36m" + "recipe".rjust(10) + "\033[0m" + "  Running #{name} recipe..." end

def ask_wizard(question)
  ask "\033[1m\033[36m" + ("option").rjust(10) + "\033[1m\033[36m" + "  #{question}\033[0m"
end

def yes_wizard?(question)
  answer = ask_wizard(question + " \033[33m(y/n)\033[0m")
  case answer.downcase
    when "yes", "y"
      true
    when "no", "n"
      false
    else
      yes_wizard?(question)
  end
end

def no_wizard?(question); !yes_wizard?(question) end

def remove_gem(gem_name)
  gsub_file('Gemfile', /^gem\s+["']#{gem_name}["'].*$\n/, '')
  # or idented (group gems)
  gsub_file('Gemfile', /^  gem\s+["']#{gem_name}["'].*$\n/, '')
end

def remove_comments(file)
  gsub_file(file, /^\s*#.*\n/, '') # remove comments
end

def add_gem_to_development_and_test(gem_name, version_str = nil)
  version_str = ", '#{version_str}'" unless version_str.nil?
  insert_into_file 'Gemfile', "\n  gem '#{gem_name}'#{version_str}",
    after: 'group :development, :test do'
end
