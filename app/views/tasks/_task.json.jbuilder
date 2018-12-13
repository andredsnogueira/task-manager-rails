json.extract! task, :id, :title, :description, :address, :door_number, :postal_code, :start_hour, :end_hour, :status, :deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
