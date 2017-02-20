json.extract! house, :id, :name, :capacity, :description, :created_at, :updated_at
json.url house_url(house, format: :json)