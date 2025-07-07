# frozen_string_literal: true

class FilterTask
  class << self
    def call(name_query, status_query)
      scope = Task.unscoped
        .joins("INNER JOIN collaborators ON collaborators.id = tasks.collaborator_id")
        .includes(collaborator: :sector)

      if name_query.present?
        scope = scope.where("collaborators.name ILIKE ?", "%#{name_query}%")
      end

      if status_query.present?
        scope = scope.where(task_status: status_query)
      end

      scope
    end
  end
end
