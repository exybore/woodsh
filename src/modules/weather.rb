require 'openweathermap'
require_relative 'module'

API = OpenWeatherMap::API.new(Woodsh::CONFIG.data['openweathermap_key'], 'en', 'metric')

module Woodsh
  module Modules
    # Retrieve weather informationruby on a specific location.
    # This command uses the openweathermap gem
    class Weather < Module
      def self.exec(args)
        begin
          data = ::API.current(args)
        rescue OpenWeatherMap::Exceptions::UnknownLocation
          puts 'Error while getting weather data : unknown location'
        rescue OpenWeatherMap::Exceptions::Unauthorized
          puts "Error while getting weather data : you're not allowed to interact with the OpenWeatherMap API. Check your API key in the config/data.yml file."
        else
          puts "#{data.weather_conditions.emoji}  #{data.city.name}, #{data.city.country} : #{data.weather_conditions.description}"
        end
      end
    end
  end
end