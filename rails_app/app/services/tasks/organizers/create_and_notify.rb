# frozen_string_literal: true

module Tasks
  module Organizers
    class CreateAndNotify
      include Interactor::Organizer

      organize Interactors::Create, Interactors::Notify
    end
  end
end
