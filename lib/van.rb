require_relative './bike_container'

class Van

	include BikeContainer

	def collect_broken_bikes_from(station)
		station.broken_bikes.each do |bike|
			dock(bike) if bike.broken?
			station.release_broken_bikes
		end
	end

end