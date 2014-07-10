require './lib/docking_station'

describe DockingStation do

	let(:station) { DockingStation.new(:capacity => 123) }

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(123)
	end

	it 'should know if it is empty' do
		@bikes = []
		expect(station.empty?). to be true
	end

end