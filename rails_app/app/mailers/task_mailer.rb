# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  def notify_collaborator(task)
    @task = task
    mail(
      to: task.collaborator.email,
      subject: "Nova tarefa atribuída: #{@task.description}",
    )
  end
end
