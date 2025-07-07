# frozen_string_literal: true

class Collaborator < ApplicationRecord
  belongs_to :sector
  has_many :tasks, dependent: :destroy

  default_scope { where(enabled: true) }

  class << self
    def search(query)
      unscoped.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
    end
  end
end
