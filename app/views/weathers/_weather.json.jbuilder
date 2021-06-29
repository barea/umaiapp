json.extract! weather, :id, :weather_info, :city_name, :country, :dt, :created_at, :updated_at
json.url weather_url(weather, format: :json)
