require './lib/van'

describe Van do

	let(:van) {Van.new}
	let(:bad_bike) {double :bike, broken?: true, is_a?: Bike}
	let(:good_bike) {double :bike, broken?: false, is_a?: Bike}
	let(:station) {double :station, broken_bikes: [bad_bike], available_bikes: [good_bike], release_broken_bikes: [bad_bike], bikes: [good_bike]}

	it 'should contain no bikes at first' do
		expect(van).to be_empty
	end

	it 'should be able to contain bikes' do
		van = Van.new(:bikes)
		expect(van).to have_bikes
	end

	it 'should cause station to release broken bikes for repair' do
		station = double :station, broken_bikes: [bad_bike]
		expect(station).to receive(:release_broken_bikes)
		van.collect_broken_bikes_from(station)
	end

	it 'should collect broken bikes' do
		van.collect_broken_bikes_from(station)
		expect(van.bikes).to eq [bad_bike]
	end

	it 'should only take broken bikes' do
		van.collect_broken_bikes_from(station)
		expect(station.bikes).to eq [good_bike]
	end

end