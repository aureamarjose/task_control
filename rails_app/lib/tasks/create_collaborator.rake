# frozen_string_literal: true

namespace :create_collaborator do
  desc "Create a collaborator with tasks"
  task collaborator: :environment do
    show_spinner("Creating Collaborators") do
      15.times do
        Collaborator.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          sector: Sector.all.sample,
        )
      end
    end
  end
end
