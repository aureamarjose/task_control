# frozen_string_literal: true

module Components
  module Input
    class SearchListInput < Components::Base
      def initialize(data:, form:, label:, controller_search:, url:, name:, controller_2:, action_2:, target_2:, **args)
        super(**args)
        @data = data
        @form = form
        @label = label
        @controller_search = controller_search
        @url = url
        @name = name
        @controller_2 = controller_2
        @action_2 = action_2
        @target_2 = target_2
      end

      def view_template
        div(data: {
          controller: @controller_search,
          "components--searchlist-url-value": @url,
          "components--searchlist-name-value": @name,
        }) do
          div(class: "w-full relative") do
            @form.label(@label, class: "block mb-2 text-sm font-medium text-gray-900 dark:text-white")

            @form.text_field(@data, data: { controller: @controller_2, "#{@controller_2}-target": @target_2, action: "input->#{@controller_2}##{@action_2}  input->#{@controller_search}#search", "#{@controller_search}-target": "inputSearch" }, class: "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500", placeholder: "Pesquisar...", autocomplete: "off")

            div(data: { "#{@controller_search}-target": "results" }, class: "absolute z-20 w-full text-sm font-medium text-gray-900 bg-white  border-gray-200 rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white") do
            end
          end
        end
      end
    end
  end
end
