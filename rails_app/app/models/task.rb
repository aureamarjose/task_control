# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :collaborator
  enum :task_status, { not_started: 0, in_progress: 1, completed: 2, canceled: 3 }
end
