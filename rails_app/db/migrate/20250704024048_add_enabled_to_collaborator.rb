# frozen_string_literal: true

class AddEnabledToCollaborator < ActiveRecord::Migration[8.0]
  def change
    add_column(:collaborators, :enabled, :boolean, default: true)
  end
end
