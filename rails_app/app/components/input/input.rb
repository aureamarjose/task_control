# frozen_string_literal: true

module Components
  module Input
    class Input < Components::Base
      def initialize(label:, form:, data:, placeholder:)
        super()
        @label = label
        @form = form
        @data = data
        @placeholder = placeholder
      end

      def view_template
        div do
          @form.label(@label, class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white")
          @form.text_field(@data, class: "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500", placeholder: @placeholder.to_s)
        end
      end
    end
  end
end
