# frozen_string_literal: true

class FilterCollaborator
  class << self
    def call(query)
      Collaborator.unscoped.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
    end
  end
end
