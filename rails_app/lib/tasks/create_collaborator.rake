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

private

def show_spinner(msg_start, msg_end = "Completed successfully!")
  spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :pulse_2)
  spinner.auto_spin
  yield
  spinner.success("(#{msg_end})")
end
