class OpenWeatherMap

	URL = "https://api.openweathermap.org/data/2.5/forecast"
	APPID = "cadc66f01eb35f2856c8112f511fa866"


	def initialize(city_name, dt)

      @city_name = city_name
      @dt = dt
   end
	

	def fetch_data	 
		weather_info = fetch_data_from_db 

		unless weather_info.present?
		weather_info = fetch_data_from_api
		end

		return weather_info
	end



	def fetch_data_from_db
		puts "fetch_data_from_db"
		return Weather.where(city_name: @city_name, dt: @dt).first
				
	end


	def fetch_data_from_api
		puts "fetch_data_from_api"
		if @dt.present?
		response = HTTParty.get(URL, query: { q: @city_name, appid: APPID})
		response_data = JSON.parse(response.body, {:symbolize_names => true})
		response_data[:list].each do |item|
			if item[:dt_txt] == @dt 
 			@weather = Weather.new(city_name: response_data[:city][:name], country:  response_data[:city][:country], weather_info: item, dt: item[:dt_txt])
 			if @weather.save
 				return @weather
 				puts @weather
 			end
 			end
	 	 end
 	 	end 
 	 end

end

	# def export_data_csv(results)
	# 	csv_string = CSV.generate do |csv|
	# 		csv << ["humidity", "temp"]
	# 		results.each do |item|
	# 			csv << [item[:main][:humidity], item[:main][:temp]]
	# 		end
	# 	end
	# end


# obj = OpenWeatherMap.new(:city_name: df)
# obj.fetch_data

