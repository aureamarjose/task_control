# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
def show_spinner(msg_start, msg_end = "Completed successfully!")
  spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :pulse_2)
  spinner.auto_spin
  yield
  spinner.success("(#{msg_end})")
end

# Create default sectors
show_spinner("Creating sectors") do
  ["Human Resources", "Finance", "Sales", "Marketing", "Production"].each do |sector_name|
    Sector.find_or_create_by!(name: sector_name)
  end
end
