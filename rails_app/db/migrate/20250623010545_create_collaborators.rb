# frozen_string_literal: true

class CreateCollaborators < ActiveRecord::Migration[8.0]
  def change
    create_table(:collaborators) do |t|
      t.string(:name)
      t.string(:email)
      t.references(:sector, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
