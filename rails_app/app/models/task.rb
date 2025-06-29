# frozen_string_literal: true

class Task < ApplicationRecord
  enum :task_status, { pending: 0, in_progress: 1, completed: 2 }
end
