# frozen_string_literal: true

class CollaboratorDecorator
  def initialize(collaborator, sectors_hash = {})
    @collaborator = collaborator
    @sectors_hash = sectors_hash
  end

  def sector_name
    @collaborator.sector&.name || begin
      @sectors_hash[@collaborator.sector_id]&.name || "Sector not found"
    end
  end
end
