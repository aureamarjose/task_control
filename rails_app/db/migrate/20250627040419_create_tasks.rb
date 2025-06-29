# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table(:tasks) do |t|
      t.text(:description)
      t.date(:start_date)
      t.date(:end_date)
      t.date(:due_date)
      t.integer(:task_status, default: 0)
      t.references(:collaborators, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
