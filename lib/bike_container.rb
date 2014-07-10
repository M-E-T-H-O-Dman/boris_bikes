require './lib/bikes'

module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||=[]
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count 
	end

	def dock(bike)
		raise "We're full, son!" if full?
		raise "Get that out of my dock!" unless bike.is_a?(Bike)
		bikes << bike
	end

	def release(bike = bikes.first)
		bikes.delete(bike) {"That bike is not present"}
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bikes.empty?
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		@broken_bikes = bikes.select {|bike| bike.broken?}
	end

	def release_broken_bikes
		bikes.delete_if{|bike| bike.broken?}
	end

end