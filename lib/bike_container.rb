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
		bikes << bike
	end

	def release(bike = bikes.first)
		unless bike.broken? == true
			bikes.delete(bike) {"That bike is not present"}
		end
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end
end