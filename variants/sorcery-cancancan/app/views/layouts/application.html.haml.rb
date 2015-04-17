insert_into_file 'app/views/layouts/application.html.haml', after: /^*.navbar-right/ do
  <<-'RUBY'

            - if current_user
              %li.dropdown
                %a.dropdown-toggle{ href: "#", data: { toggle: "dropdown" }, role: "button", aria: { expanded: "false" } }
                  %i.fa.fa-user
                  = current_user.email
                  %span.caret
                %ul.dropdown-menu{ role: "menu" }
                  %li= link_to t('user_sessions.logout'), logout_path, method: :destroy
  RUBY
end
