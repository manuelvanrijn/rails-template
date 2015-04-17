RAILS_REQUIREMENT = '~> 4.2.0'

def apply_template!
  assert_minimum_rails_version
  add_template_repository_to_source_path

  remove_file 'README.rdoc'
  template 'README.md.tt', force: true
  template 'DEPLOYMENT.md.tt', force: true

  template 'Gemfile.tt', force: true

  template 'example.env.tt', '.env'
  template 'ruby-version.tt', '.ruby-version'
  template 'erdconfig.tt', '.erdconfig'
  copy_file 'rubocop.yml', '.rubocop.yml'
  copy_file '.capistrano/metrics', '.capistrano/metrics'
  copy_file 'gitignore', '.gitignore', force: true

  apply 'app/template.rb'
  apply 'config/template.rb'
  apply 'bin/template.rb'
  apply 'lib/template.rb'
  apply 'vendor/template.rb'

  remove_file 'public/favicon.ico'

  # run 'bundle install'

  apply 'variants/default/template.rb'
  apply 'variants/twitter-bootstrap/template.rb'
  apply 'variants/sorcery-cancancan/template.rb'

  # run a final bundle install before initial commit
  # run 'bundle install'

  # setup git
  git :init
  git add: '.'
  git commit: "-aqm 'Initial commit'"
  git checkout: '-b develop'
end

require 'fileutils'
require 'shellwords'

# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    source_paths.unshift(tempdir = Dir.mktmpdir('rails-template'))
    at_exit { FileUtils.remove_entry(tempdir) }
    git :clone => [
      '--quiet',
      'https://github.com/manuelvanrijn/rails-template.git',
      tempdir
    ].map(&:shellescape).join(' ')
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def assert_minimum_rails_version
  requirement = Gem::Requirement.new(RAILS_REQUIREMENT)
  rails_version = Gem::Version.new(Rails::VERSION::STRING)
  return if requirement.satisfied_by?(rails_version)

  prompt = "This template requires Rails #{RAILS_REQUIREMENT}. "\
           "You are using #{rails_version}. Continue anyway?"
  exit 1 if no?(prompt)
end

################
def git_repo_url
  @git_repo_url ||=
    ask('What is the git remote URL for this project [skip]?', :blue)
end

def production_hostname
  @production_hostname ||=
    ask_with_default('Production hostname?', :blue, 'example.com')
end

def staging_hostname
  @staging_hostname ||=
    ask_with_default('Staging hostname?', :blue, 'staging.example.com')
end

def gemfile_requirement(name)
  @original_gemfile ||= IO.read('Gemfile')
  req = @original_gemfile[/gem\s+['"]#{name}['"]\s*(,[><~= \t\d\.\w'"]*).*$/, 1]
  req && req.gsub("'", %(")).strip.sub(/^,\s*"/, ', "').gsub('"', "'")
end

# Mimic the convention used by capistrano in order to generate
# accurate deployment documentation.
def lower_case_app_name
  app_name.gsub(/[^a-zA-Z0-9_]/, '_').downcase
end

def ask_with_default(question, color, default)
  question = (question.split('?') << " [#{default}]?").join
  answer = ask(question, color)
  answer.to_s.strip.empty? ? default : answer
end

apply_template!

return

def say_recipe(name); say "\033[1m\033[36m" + 'recipe'.rjust(10) + "\033[0m" + "  Running #{name} recipe..." end

def ask_wizard(question)
  ask "\033[1m\033[36m" + ('option').rjust(10) + "\033[1m\033[36m" + "  #{question}\033[0m"
end

def yes_wizard?(question)
  answer = ask_wizard(question + " \033[33m(y/n)\033[0m")
  case answer.downcase
    when 'yes', 'y'
      true
    when 'no', 'n'
      false
    else
      yes_wizard?(question)
  end
end

def no_wizard?(question); !yes_wizard?(question) end

def remove_comments(file)
  gsub_file(file, /^\s*#.*\n/, '') # remove comments
end

#
# ASSETS
#
say_recipe "assets"
inside 'app' do
  inside 'assets' do
    inside 'javascripts' do
      scripts = ""
      scripts = "//= require bootstrap-sprockets\n" if include_bootstrap
      gsub_file 'application.js', /\/\/= require turbolinks/, scripts
    end
    inside 'stylesheets' do
      if include_bootstrap
        gsub_file 'application.css', /\*= require_tree ./ do
<<-STYLES
*
 * GEM COMPONENTS
 * -------------------------------------
 *= require font-awesome
 *
 * BOWER-RAILS COMPONENTS
 * -------------------------------------
 *
 * CUSTOM CSS
 * -------------------------------------
 *= require bootstrap_overrides
STYLES
        end
        download_file "#{template_url}/app/assets/stylesheets/bootstrap_overrides.scss"
      end
    end
  end
  inside 'views' do
    inside 'layouts' do
      remove_file 'application.html.erb'
      download_file "#{template_url}/app/views/layouts/application.html.haml"
    end
  end
end
