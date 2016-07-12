module DecorateInstanceVariables
  extend ActiveSupport::Concern

  def render(*args)
    self.instance_variables.select {|variable|
      not variable.to_s.start_with?('@_')
    }.map {|variable_name|
      [variable_name, self.instance_variable_get(variable_name)]
    }.select {|variable_name, variable|
      variable.respond_to?(:decorate)
    }.each { |variable_name, variable|
      begin
        instance_variable_set(variable_name, variable.decorate)
      rescue Draper::UninferrableDecoratorError
        nil
      end
    }
    super(*args)
  end
end
