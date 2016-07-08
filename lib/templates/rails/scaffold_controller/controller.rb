<%
def flash?
  if defined?(ApplicationController)
    !ApplicationController.responder.ancestors.include?(Responders::FlashResponder)
  else
    Rails.application.config.responders.flash_keys.blank?
  end
end
-%>
<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  before_action :set_<%= plural_table_name %>, only: [:index]

  respond_to :html, :json

<% unless options[:singleton] -%>
  def index
    respond_with(@<%= plural_table_name %>)
  end
<% end -%>

  def show
    respond_with(@<%= singular_table_name %>)
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_with(@<%= singular_table_name %>)
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    <%= "flash[:notice] = '#{class_name} was successfully created.' if " if flash? %>@<%= orm_instance.save %>
    respond_with(@<%= singular_table_name %>)
  end

  def update
    <%= "flash[:notice] = '#{class_name} was successfully updated.' if " if flash? %>@<%= orm_instance.update("#{singular_table_name}_params") %>
    respond_with(@<%= singular_table_name %>)
  end

  def destroy
    @<%= orm_instance.destroy %>
    respond_with(@<%= singular_table_name %>)
  end

  private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def set_<%= plural_table_name %>
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params[:<%= singular_table_name %>]
    <%- else -%>
    params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end
end
<% end -%>
