if apply_twitter_bootstrap?
  insert_into_file 'app/helpers/application_helper.rb', before: /^end/ do
    <<-'RUBY'
  # override default kaminari pagination method to use twitter-bootstrap theme
  def paginate(objects, options={})
    options.reverse_merge!(theme: 'twitter-bootstrap-3')
    super(objects, options)
  end
  RUBY
  end
end
