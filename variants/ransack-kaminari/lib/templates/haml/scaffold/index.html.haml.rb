if apply_twitter_bootstrap?
  insert_into_file 'lib/templates/haml/scaffold/index.html.haml', after: /%h1= <%= class_name %>.model_name.human\n/ do
    <<-'RUBY'

.row
  .col-sm-5.col-sm-offset-7
    = search_form_for @q, class: 'search-form' do |f|
      .input-group
        = f.search_field :<%= attributes.first.name %>_cont, class: 'form-control'
        %span.input-group-btn
          %button.btn.btn-primary
            %i.fa.fa-search
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

insert_into_file 'lib/templates/haml/scaffold/index.html.haml', before: /^= link_to t('actions.create')*/ do
  <<-'RUBY'

= paginate @<%= plural_table_name %>

  RUBY
end
