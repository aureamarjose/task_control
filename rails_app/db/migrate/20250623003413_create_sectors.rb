# frozen_string_literal: true

class CreateSectors < ActiveRecord::Migration[8.0]
  def change
    create_table(:sectors) do |t|
      t.string(:name)

      t.timestamps
    end
  end
end
