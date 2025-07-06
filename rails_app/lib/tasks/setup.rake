# frozen_string_literal: true

namespace :setup do
  desc "Populating the database"
  task populate: :environment do
    # load Rails.root.join("db/seeds.rb")
    if Rails.env.development?

      show_spinner("Dropping Database - ") do
        # Encerra conexões ativas com o banco antes de dropar
        ActiveRecord::Base.connection.execute(<<-SQL)
        SELECT pg_terminate_backend(pg_stat_activity.pid)
        FROM pg_stat_activity
        WHERE pg_stat_activity.datname = 'task_control_development'
          AND pid <> pg_backend_pid();
        SQL
        Rake::Task["db:drop"].invoke
      end
      show_spinner("Creating Database - ") { Rake::Task["db:create"].invoke }
      show_spinner("Migrating Database - ") { Rake::Task["db:migrate"].invoke }
      Rake::Task["db:seed"].invoke
      Rake::Task["create_collaborator:collaborator"].invoke
      Rake::Task["create_tasks:tasks"].invoke
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
