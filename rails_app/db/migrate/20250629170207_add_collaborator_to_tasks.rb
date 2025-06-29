# frozen_string_literal: true

class AddCollaboratorToTasks < ActiveRecord::Migration[8.0]
  def change
    add_reference(:tasks, :collaborator, null: false, foreign_key: true)
  end
end
