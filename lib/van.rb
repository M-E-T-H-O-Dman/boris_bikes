require_relative './bike_container'

class Van

	include BikeContainer

	def initialize(bikes=nil)
		@bikes ||= bikes
	end

	def collect_broken_bikes_from(station)
		@bikes = station.release_broken_bikes
	end

	def has_bikes?
		!@bikes.nil?
	end

end