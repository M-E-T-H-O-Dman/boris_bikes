require 'bikes'

describe Bike do

	let (:trek) { Bike.new}
	 
	 it 'should not be broken after we create it' do
	 	expect(trek.broken?).to be false
	 end

	 it 'should be breakable' do
		trek.break!
		expect(trek).to be_broken
	 end

	 it 'should be fixable' do
	 	trek.break!
	 	trek.fix!
	 	expect(trek).not_to be_broken
	 end

end