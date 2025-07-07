# frozen_string_literal: true

module Components
  module Input
    class Select < Components::Base
      def initialize(label:, form:, data:, select_options:, include_blank:)
        super()
        @label = label
        @form = form
        @data = data
        @select_options = select_options
        @include_blank = include_blank
      end

      def view_template
        div do
          @form.label(@label, class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white")
          @form.select(@data, @select_options, { include_blank: @include_blank }, class: "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500")
        end
      end
    end
  end
end
