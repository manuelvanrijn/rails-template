if apply_twitter_bootstrap?
  copy_file 'variants/ransack-kaminari/spec/helpers/application_helper_spec.rb',
            'spec/helpers/application_helper_spec.rb'
end
