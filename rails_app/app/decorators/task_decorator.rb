# frozen_string_literal: true

class TaskDecorator
  def initialize(task, collaborators_hash = {}, sectors_hash = {})
    @task = task
    @collaborators_hash = collaborators_hash
    @sectors_hash = sectors_hash
  end

  def collaborator_name
    @task.collaborator&.name || @collaborators_hash[@task.collaborator_id]&.name || "Collaborator not found"
  end

  def sector_name
    @task.collaborator&.sector&.name || begin
      collab = @collaborators_hash[@task.collaborator_id]
      collab&.sector_id ? @sectors_hash[collab.sector_id]&.name : nil
    end || "Sector not found"
  end
end
