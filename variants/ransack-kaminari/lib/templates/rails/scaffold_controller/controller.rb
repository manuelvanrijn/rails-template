insert_into_file 'lib/templates/rails/scaffold_controller/controller.rb', after: /def index\n/ do
  <<-RUBY
    @q = @<%= plural_table_name %>.search params[:q]
    @<%= plural_table_name %> = @q.result.page(params[:page])
  RUBY
end

gsub_file 'lib/templates/rails/scaffold_controller/controller.rb',
          'respond_with @<%= plural_table_name %>',
          'respond_with @<%= plural_table_name %>, meta: pagination_meta(@<%= plural_table_name %>)'
