# frozen_string_literal: true

module Tasks
  module Interactors
    class Notify
      include Interactor
      def call
        task = context.task
        if task.persisted?
          puts "--------------Task '#{task.description}' was successfully created with ID: #{task.id}."
        else
          puts "-----------------Failed to create task. Errors: #{task.errors.full_messages.join(", ")}"
          context.fail!(error: "---------------Task creation failed")
        end
      rescue StandardError => e
        puts "An error occurred while notifying: #{e.message}"
        context.fail!(error: "Notification failed")
      end
    end
  end
end
