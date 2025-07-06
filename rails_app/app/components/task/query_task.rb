# frozen_string_literal: true

module Components
  module Task
    class QueryTask < Components::Base
      def initialize
        super
      end

      def view_template
        form_with(url: tasks_path, method: :get) do |f|
          div(class: "mt-8 border relative shadow-md sm:rounded-lg") do
            p(class: "border-b ps-5 py-2 text-lg font-medium text-gray-900 dark:text-white") { " Task filter" }
            div(class: "p-5 grid gap-3 lg:grid-cols-4") do
              render(Input::SearchListInput.new(
                data: :name,
                form: f,
                label: "Name collaborator",
                controller_search: "components--searchlist",
                url: "/collaborators/search?query_name",
                name: "name",
                controller_2: "",
                action_2: "",
                target_2: "",
              ))
            end
          end
        end
      end
    end
  end
end
