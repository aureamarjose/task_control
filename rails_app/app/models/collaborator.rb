# frozen_string_literal: true

class Collaborator < ApplicationRecord
  belongs_to :sector
  has_many :tasks, dependent: :destroy

  default_scope { where(enabled: true) }
end
