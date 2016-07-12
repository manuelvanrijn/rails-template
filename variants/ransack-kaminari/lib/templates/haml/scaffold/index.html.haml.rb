if apply_twitter_bootstrap?
  insert_into_file 'lib/templates/haml/scaffold/index.html.haml', after: /%h1= <%= class_name %>.model_name.human.pluralize/ do
    <<-'RUBY'

.row
  .col-sm-6
    = search_form_for @q, class: 'search-form' do |f|
      .input-group
        = f.search_field :<%= attributes.first.name %>_cont, class: 'form-control'
        %span.input-group-btn
          %button.btn.btn-primary
            %i.fa.fa-search
  .col-sm-6
    .pull-right
      = paginate @<%= plural_table_name %>
  RUBY
  end
else
  insert_into_file 'lib/templates/haml/scaffold/index.html.haml', after: /%h1= <%= class_name %>.model_name.human\n/ do
    <<-'RUBY'

= search_form_for @q, class: 'search-form' do |f|
  = f.label :<%= attributes.first.name %>_cont
  = f.search_field :<%= attributes.first.name %>_cont
  = f.submit
  RUBY
  end
end

gsub_file 'lib/templates/haml/scaffold/index.html.haml',
          '%th= <%= class_name %>.human_attribute_name :<%= attribute.name %>',
          '%th= sort_link(@q, :<%= attribute.name %>, <%= class_name %>.human_attribute_name(:<%= attribute.name %>))'

if apply_sorcery_cancancan?
  search = /^\- if can\? \:create/
  gsub_file 'lib/templates/haml/scaffold/index.html.haml',
            /^\- if can\? \:create.*\n/, ''
  gsub_file 'lib/templates/haml/scaffold/index.html.haml',
            /  = link_to t\('actions.create'\).*\n/, ''
  append_to_file 'lib/templates/haml/scaffold/index.html.haml' do
<<-'RUBY'
.row
  .col-sm-6
    - if can? :create, <%= class_name %>
      = link_to t('actions.create'), new_<%= singular_table_name %>_path, class: 'btn btn-primary'
  .col-sm-6
    .pull-right
      = paginate @<%= plural_table_name %>
RUBY
  end
else
  search = /= link_to t\('actions.create'\)/
end
