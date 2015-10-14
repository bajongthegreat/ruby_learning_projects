require 'spec_helper'
require 'product_inventory'

describe Product do

	it 'returns a string' do 
		expect(Product.new 100, "box", 150).to be_a Product
	end

end

describe Inventory do
	
    before(:each) do
    	@paper = Product.new(100, 'paper', 123)
    end

	it 'adds an item' do

		# Adding inventory
		[@paper].each do |item|
			Inventory::add(item.id, item.quantity)
		end

		expect(Inventory::current_inventory).to include("paper" => 123)
	end

	it 'deducts an item' do
		Inventory::deduct('paper', 23)

		expect(Inventory::current_inventory).to include("paper" => 100)
	end


end
