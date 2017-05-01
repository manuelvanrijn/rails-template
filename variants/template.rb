def apply_variants
  # always apply the default variant
  apply 'variants/default/template.rb'
  git commit: "-aqm 'applied default'"

  ask_options

  if apply_twitter_bootstrap?
    apply 'variants/twitter-bootstrap/template.rb'
    commit('applied twitter-bootstrap')
  end
  if apply_sorcery_cancancan?
    apply 'variants/sorcery-cancancan/template.rb'
    commit('applied sorcery_cancancan')
  end
  if apply_ransack_kaminari?
    apply 'variants/ransack-kaminari/template.rb'
    commit('applied ransack_kaminari')
  end
  if apply_sidekiq?
    apply 'variants/sidekiq/template.rb'
    commit('applied sidekiq')
  end
end

def ask_options
  apply_twitter_bootstrap?
  apply_sorcery_cancancan?
  apply_ransack_kaminari?
  apply_sidekiq?
end

def apply_twitter_bootstrap?
  @variant_twitter_bootstrap ||= yes_wizard?  '          [THEME] | include twitter bootstrap?'
end

def apply_sorcery_cancancan?
  @variant_sorcery_cancancan ||= yes_wizard?  '           [AUTH] | include Authentication & Authorization using sorcery and cancancan?'
end

def apply_ransack_kaminari?
  @variant_ransack_kaminari ||= yes_wizard?   '[SEARCH/PAGINATE] | include pagination/searching/ordering out of the box using kaminari and ransack?'
end

def apply_sidekiq?
  @variant_sidekiq ||= yes_wizard?            '[BACKGROUND JOBS] | include Sidekiq for processing heavy or time intensive (background) tasks?'
end

#
# Helper methods
#
def say_recipe(name)
  say "\033[1m\033[36m" + 'variant'.rjust(10) + "\033[0m" + "  Running #{name} variant..."
end

def ask_wizard(question)
  ask "\033[1m\033[36m" + ('option').rjust(10) + "\033[1m\033[36m" + "  #{question}\033[0m"
end

def ask_wizard_with_default(question, default)
  answer = ask_wizard("#{question} \033[33m(default: #{default}):\033[0m")
  answer.to_s.strip.empty? ? default : answer
end

def yes_wizard?(question)
  return true if ENV['DEBUG'].present?
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

def no_wizard?(question)
  !yes_wizard?(question)
end

def commit(message)
  git add: '.'
  git commit: "-aqm '#{message}'"
end

# Let's take some orders
apply_variants
