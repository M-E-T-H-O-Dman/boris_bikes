require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let (:astana) {Bike.new}
	let (:marin) {Bike.new}
	let (:trek) {Bike.new}
	let (:holder) {ContainerHolder.new}

	def fill_holder(holder)
		10.times { holder.dock(Bike.new)}
	end

	it "should accept a bike" do 
		expect(holder.bike_count).to eq(0)
		holder.dock(astana)
		expect(holder.bike_count).to eq(1)
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

	it 'Should not accept items other than bikes' do
		expect{holder.dock("not a bike")}.to raise_error(RuntimeError)
		expect(holder.bike_count).to eq(0)
	end	

	it "should release a bike" do
		holder.dock(astana)
		holder.release(astana)
		expect(holder.bike_count).to eq(0)
	end

	it "should not release a bike that is not present" do
		holder.dock(astana)
		holder.release(marin)
		expect(holder.bike_count).to eq(1)
	end

	it "request to release non-existent bike should return an error message" do
		holder.dock(astana)
		expect(holder.release(marin)).to eq "That bike is not present"
	end

	it "should release a bike even if a particular bike is not specified" do
		holder.dock(astana)
		holder.release()
		expect(holder.bike_count).to eq(0)
	end

	it 'should provide the list of available bikes' do
		trek.break!
		holder.dock(astana)
		holder.dock(trek)
		expect(holder.available_bikes).to eq([astana])
	end

	it 'should know which bikes are broken' do
		trek.break!
		holder.dock(marin)
		holder.dock(trek)
		expect(holder.broken_bikes).to eq [trek]
	end

	it 'should release broken bikes' do
		trek.break!
		holder.dock(marin)
		holder.dock(trek)
		holder.release_broken_bikes
		expect(holder.bike_count).to eq(1)
	end

end