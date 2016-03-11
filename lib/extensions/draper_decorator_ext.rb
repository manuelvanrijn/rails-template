module Draper
  # Example:
  #   File: en.yml
  #
  #   en:
  #     decorators:
  #       client:
  #         some_key: some value
  #
  #   File client_decorator.rb
  #
  #     class ClientDecorator < Draper::Decorator
  #       delegate_all
  #
  #       def some_key
  #         t('.some_key') # results in en.decorators.client.some_key
  #         t('some_root.some_key') # results in en.some_root.some_key
  #       end
  #     end
  #
  class Decorator
    def t(key, options = {})
      if key[0] != '.'
        I18n.t(key, options)
      else
        I18n.t("#{translation_key}#{key}", options)
      end
    end

    private

    def translation_key
      class_name = self.class.name.underscore.split('_decorator')[0]
      "decorators.#{class_name}"
    end
  end
end
