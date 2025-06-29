# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :collaborator
  enum :task_status, { pending: 0, in_progress: 1, completed: 2 }
end
