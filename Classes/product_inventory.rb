#https://github.com/karan/Projects#classes
#Product Inventory Project

class Product

	attr_reader :id, :quantity

	def initialize (price, id, quantity)
		@price = price
		@id = id
		@quantity = quantity

		puts 'Created a new product.'
	end
end

class Inventory
	

	@@stocks = {}

	class << self 
		
		def add(item, quantity) 
			if @@stocks.has_key?(item)
				@@stocks[item] += quantity
				puts 'Stocks add.'
			else
				@@stocks[item] = quantity
				puts 'stocks initialized'
			end

		end

		def deduct(item, quantity)
			if @@stocks.has_key?(item)
				@@stocks[item] -= quantity 
			else
				puts 'Stock not found. Please add it instead.'
			end
		end

		def current_inventory
			@@stocks
		end

	end
end


boxr = Product.new(120, 'box', 1005)
box = Product.new(120, 'box', 1005)
paper = Product.new(100, 'paper', 123)

# Adding inventory
[boxr, box,paper].each do |item|
	Inventory::add(item.id, item.quantity)
end

# Deducting inventory
purchases = {:box => 32, :paper => 60}

purchases.each do |item, quantity|
	Inventory::deduct(item.to_s,quantity)
end

#Current Inventory
p Inventory::current_inventory






