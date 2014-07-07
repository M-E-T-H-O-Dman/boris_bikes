require 'docking_station'

describe DockingStation do

	let (:astana) {Bike.new}
	let (:station) {DockingStation.new(:capacity => 20)}

	it "should accept a bike" do 
		expect(station.bike_count).to eq(0)
		station.dock(astana)
		expect(station.bike_count).to eq(1)
	end

	it "should release a bike" do
		station.dock(astana)
		station.release(astana)
		expect(station.bike_count).to eq(0)
	end

	it 'should know when full' do 
		expect(station).not_to be_full
		20.times { station.dock(Bike.new) }
		expect(station).to be_full
	end	
end
