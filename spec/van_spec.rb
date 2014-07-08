require './lib/van'

describe Van do


	it 'should contain no bikes at first' do
		van = Van.new
		expect(van).not_to have_bikes
	end

	it 'should be able to contain bikes' do
		van = Van.new(:bikes)
		expect(van).to have_bikes
	end

	it 'should cause station to release broken bikes for repair' do
		station = double :station
		van = Van.new
		expect(station).to receive(:release_broken_bikes)
		van.collect_broken_bikes_from(station)
	end

	it 'should accept broken bikes from station' do
		van = Van.new
		expect(van).to have_bikes
		van.collect_broken_bikes_from(station)
	end

end