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

	it 'should know which bikes are broken' do
		marin, trek, astana = Bike.new, Bike.new, Bike.new
		trek.break!
		marin.break!
		station.dock(marin)
		station.dock(trek)
		station.dock(astana)
		expect(station.broken_bikes).to eq [marin, trek]
	end

	it 'should release broken bikes to the van' do
		marin, trek, astana = Bike.new, Bike.new, Bike.new
		trek.break!
		marin.break!
		station.dock(marin)
		station.dock(trek)
		station.dock(astana)
		expect(station.release_broken_bikes).to eq [marin, trek]
	end

end