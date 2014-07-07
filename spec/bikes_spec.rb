require 'bikes'

describe Bike do
	 
	 it 'should not be broken after we create it' do
	 	trek = Bike.new
	 	expect(trek.broken?).to be false
	 end

	 it 'should be breakable' do
	 	trek = Bike.new
		trek.break!
		expect(trek).to be_broken
	 end

end