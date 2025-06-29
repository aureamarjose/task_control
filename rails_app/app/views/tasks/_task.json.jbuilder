json.extract! task, :id, :description, :start_date, :end_date, :due_date, :task_status, :collaborators_id, :created_at, :updated_at
json.url task_url(task, format: :json)
