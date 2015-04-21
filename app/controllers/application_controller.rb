insert_into_file 'app/controllers/application_controller.rb', before: /^end/ do
  <<-'RUBY'

  # override render to decorate all objects using the 'defer_draper' gem
  def render(*args)
    decorate_all
    super
  end

  private
  RUBY
end
