# frozen_string_literal: true

namespace :create_tasks do
  desc "Create tasks for collaborators"
  task tasks: :environment do
    show_spinner("Creating Tasks") do
      Collaborator.all.find_each do |collaborator|
        5.times do
          Task.create!(
            description: Faker::Lorem.sentence(word_count: 10),
            start_date: Faker::Date.between(from: 1.year.ago, to: Time.zone.today),
            end_date: Faker::Date.between(from: Time.zone.today, to: 1.year.from_now),
            due_date: Faker::Date.forward(days: 30),
            task_status: Task.task_statuses.keys.sample,
            collaborator_id: collaborator.id,
          )
        end
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
