# frozen_string_literal: true

module Components
  module Task
    class QueryTask < Components::Base
      def initialize
        super
      end

      def view_template
        form_with(url: search_tasks_path, method: :get) do |f|
          div(class: "mt-8 border relative shadow-md sm:rounded-lg") do
            p(class: "border-b ps-5 py-2 text-lg font-medium text-gray-900 dark:text-white") { " Task filter" }
            div(class: "p-5 grid gap-3 lg:grid-cols-4") do
              render(Input::SearchListInput.new(
                data: :search_name,
                form: f,
                label: "Name collaborator",
                controller_search: "components--searchlist",
                url: "/collaborators/search?query_name",
                name: "name",
                controller_2: "",
                action_2: "",
                target_2: "",
              ))

              div(class: "mt-7 h-10 grid grid-cols-2 gap-4 w-full ") do
                render(Button::Submit.new(
                  background: "bg-blue-700",
                  hover_bg: "hover:bg-blue-300",
                  text_color: "text-white",
                  hover_text: "hover:text-black",
                  form: f,
                  title: "Search",
                ))
                render(Button::Link.new(
                  background: "bg-red-700",
                  hover_bg: "hover:bg-red-400",
                  text_color: "text-white",
                  hover_text: "hover:text-black",
                  link: tasks_path,
                  title: "Clear",
                ))
              end
            end
          end
        end
      end
    end
  end
end
