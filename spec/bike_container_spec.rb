require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let (:astana) {Bike.new}
	let (:holder) {ContainerHolder.new}

	def fill_holder(holder)
		10.times { holder.dock(Bike.new)}
	end

	it "should accept a bike" do 
		expect(holder.bike_count).to eq(0)
		holder.dock(astana)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(astana)
		holder.release(astana)
		expect(holder.bike_count).to eq(0)
	end

	it 'should know when full' do 
		expect(holder).not_to be_full
		fill_holder(holder)
		expect(holder).to be_full
	end

	it 'should not accept a bike if it is full' do
		fill_holder(holder)
		expect(lambda { holder.dock(astana) }).to raise_error(RuntimeError)
	end

	it 'should provide the list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

end