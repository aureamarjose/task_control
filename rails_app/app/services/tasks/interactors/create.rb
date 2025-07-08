# frozen_string_literal: true

module Tasks
  module Interactors
    class Create
      include Interactor

      def call
        task = Task.new(context.params)
        if task.save
          context.task = task
        else
          context.task = task
          context.fail!
        end
      end
    end
  end
end
