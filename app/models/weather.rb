class Weather < ApplicationRecord

	 validates_presence_of :city_name
	 validates_presence_of :dt
	 validates_presence_of :country
	 validates_presence_of :weather_info
end
