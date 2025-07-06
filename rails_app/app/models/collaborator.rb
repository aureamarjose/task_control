# frozen_string_literal: true

class Collaborator < ApplicationRecord
  belongs_to :sector
  has_many :tasks, dependent: :destroy

  default_scope { where(enabled: true) }

  def sector_name
    sector&.name || Sector.unscoped.find_by(id: sector_id)&.name || "Sector not found"
  end
end
