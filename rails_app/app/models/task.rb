# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :collaborator
  enum :task_status, { not_started: 0, in_progress: 1, completed: 2, canceled: 3 }

  validates :description, presence: true, length: { maximum: 500 }
  validates :start_date, presence: true
  validates :collaborator_id, presence: true
  validates :task_status, presence: true

  class << self
    def search(query)
      unscoped
        .joins("INNER JOIN collaborators ON collaborators.id = tasks.collaborator_id")
        .where("collaborators.name ILIKE ?", "%#{query}%")
        .includes(collaborator: :sector)
    end
  end
end
