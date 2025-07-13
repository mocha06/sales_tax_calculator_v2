require_relative '../lib/receipt'
require_relative '../lib/item'

RSpec.describe Receipt do
  describe '#formatted_output' do
    context 'with multiple items' do
      let(:items) do
        [
          Item.new("book", 12.49, 2),
          Item.new("music CD", 14.99, 1),
          Item.new("chocolate bar", 0.85, 1)
        ]
      end
      let(:receipt) { Receipt.new(items) }

      it 'formats output correctly' do
        expected_output = [
          "2 book: 24.98",
          "1 music CD: 16.49", 
          "1 chocolate bar: 0.85",
          "Sales Taxes: 1.50",
          "Total: 42.32"
        ].join("\n")

        expect(receipt.formatted_output).to eq(expected_output)
      end
    end

    context 'with imported items' do
      let(:items) do
        [
          Item.new("imported box of chocolates", 10.00, 1),
          Item.new("imported bottle of perfume", 47.50, 1)
        ]
      end
      let(:receipt) { Receipt.new(items) }

      it 'formats output correctly' do
        expected_output = [
          "1 imported box of chocolates: 10.50",
          "1 imported bottle of perfume: 54.65",
          "Sales Taxes: 7.65",
          "Total: 65.15"
        ].join("\n")

        expect(receipt.formatted_output).to eq(expected_output)
      end
    end

    context 'with Input 3 from problem statement' do
      let(:items) do
        [
          Item.new("imported bottle of perfume", 27.99, 1),
          Item.new("bottle of perfume", 18.99, 1),
          Item.new("packet of headache pills", 9.75, 1),
          Item.new("imported boxes of chocolates", 11.25, 3)
        ]
      end
      let(:receipt) { Receipt.new(items) }

      it 'formats output correctly' do
        expected_output = [
          "1 imported bottle of perfume: 32.19",
          "1 bottle of perfume: 20.89",
          "1 packet of headache pills: 9.75",
          "3 imported boxes of chocolates: 35.55",
          "Sales Taxes: 7.90",
          "Total: 98.38"
        ].join("\n")

        expect(receipt.formatted_output).to eq(expected_output)
      end
    end
  end
end