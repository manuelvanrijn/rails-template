def apply_variants
  # always apply the default variant
  apply 'variants/default/template.rb'

  # ask and apply other variants
  apply 'variants/twitter-bootstrap/template.rb'  if apply_twitter_bootstrap?
  apply 'variants/sorcery-cancancan/template.rb'  if apply_sorcery_cancancan?
  apply 'variants/ransack-kaminari/template.rb'   if apply_ransack_kaminari?
  apply 'variants/sidekiq/template.rb'            if apply_sidekiq?
end

def apply_twitter_bootstrap?
  if @variant_twitter_bootstrap.nil?
    @variant_twitter_bootstrap = yes_wizard? 'Do you want to include twitter bootstrap?'
  end
  @variant_twitter_bootstrap
end

def apply_sorcery_cancancan?
  if @variant_sorcery_cancancan.nil?
    @variant_sorcery_cancancan ||= yes_wizard? 'Do you want to include Authentication & Authorization using sorcery and cancancan?'
  end
  @variant_sorcery_cancancan
end

def apply_ransack_kaminari?
  if @variant_ransack_kaminari.nil?
    @variant_ransack_kaminari ||= yes_wizard? 'Do you want to pagination/searching/ordering out of the box using kaminari and ransack?'
  end
  @variant_ransack_kaminari
end

def apply_sidekiq?
  if @variant_sidekiq.nil?
    @variant_sidekiq = yes_wizard? 'Do you want to include SideKiq for processing heavy or time intensive (background) tasks?'
  end
  @variant_sidekiq
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

# Let's take some orders
apply_variants
