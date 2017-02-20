json.extract! calendar, :id, :name, :start_date, :end_date, :active, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)