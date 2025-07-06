# frozen_string_literal: true

class AddEnabledToSector < ActiveRecord::Migration[8.0]
  def change
    add_column(:sectors, :enabled, :boolean, default: true)
  end
end
