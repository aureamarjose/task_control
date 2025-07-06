# frozen_string_literal: true

module Components
  module Task
    class QueryTask < Components::Base
      def view_template
        h1 { "QueryTask" }
        p { "Find me in app/components/query_task.rb" }
      end
    end
  end
end
