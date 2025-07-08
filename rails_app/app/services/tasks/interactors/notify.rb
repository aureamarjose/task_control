# frozen_string_literal: true

module Tasks
  module Interactors
    class Notify
      include Interactor
      def call
        task = context.task
        if task.persisted?
          TaskMailer.notify_collaborator(task).deliver_later
        else
          context.fail!(error: "---------------Task creation failed")
        end
      end
    end
  end
end
