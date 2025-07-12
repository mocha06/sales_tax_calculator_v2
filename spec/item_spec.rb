require_relative '../lib/item'

RSpec.describe Item do
	describe 'initialize' do

		let(:item) { Item.new("book", 12.49, 2) }
		it 'creates an item with name, price, and quantity' do
			expect(item.name).to eq("book")
			expect(item.price).to eq(12.49)
			expect(item.quantity).to eq(2)
		end
	end
end