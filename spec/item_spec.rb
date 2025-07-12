require_relative '../lib/item'

RSpec.describe Item do
  let(:item) { Item.new("book", 12.49, 2) }

  describe 'initialize' do
    it 'creates an item with name, price, and quantity' do
      expect(item.name).to eq("book")
      expect(item.price).to eq(12.49)
      expect(item.quantity).to eq(2)
    end
  end

  describe 'imported?' do
    context 'when item is imported' do
      let(:item) { Item.new("imported book", 12.49, 2) }

      it { expect(item.imported?).to be true }
    end

    context 'when item is not imported' do
      let(:item) { Item.new("book", 12.49, 2) }

      it { expect(item.imported?).to be false }
    end
  end

  describe 'tax_exempt?' do
    context 'when an item is exempt' do
      expected_exempted_items = ['book', 'chocolate', 'headache pills', 'pills']

      expected_exempted_items.each do |name|
        it "marks '#{name}' as tax-exempt for '#{name}'" do
          item = Item.new(name, 12.49, 2)
          expect(item.tax_exempt?).to be true
        end
      end
    end

    context 'when an item is not exempt' do
      non_exempted_items = ['perfume', 'music CD']

      non_exempted_items.each do |name|
        it "does not mark '#{name}' as tax-exempt" do
          item = Item.new(name, 10.0, 1)
          expect(item.tax_exempt?).to be false
        end
      end
    end
  end
end