insert_into_file 'lib/templates/rails/scaffold_controller/controller.rb', after: /def index\n/ do
  <<-'RUBY'
    @q = @<%= plural_table_name %>.search params[:q]
    @<%= plural_table_name %> = @q.result.page(params[:page])
  RUBY
end
