# frozen_string_literal: true

class Sector < ApplicationRecord
  has_many :collaborators, dependent: :destroy
  default_scope { where(enabled: true) }
end
