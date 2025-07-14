require_relative '../lib/input_parser'

RSpec.describe InputParser do
  describe '.parse_to_item' do
    it 'parses single item correctly' do
      item = InputParser.parse_to_item("2 book at 12.49")

      expect(item.name).to eq("book")
      expect(item.price).to eq(12.49)
      expect(item.quantity).to eq(2)
    end
    
    it 'parses imported items correctly' do
      item = InputParser.parse_to_item("1 imported bottle of perfume at 47.50")

      expect(item.name).to eq("imported bottle of perfume")
      expect(item.price).to eq(47.50)
      expect(item.quantity).to eq(1)
      expect(item.imported?).to be true
    end
    
    it 'handles whitespace correctly' do
      item = InputParser.parse_to_item("  3  chocolate bar  at  0.85  ")
      
      expect(item.name).to eq("chocolate bar")
      expect(item.price).to eq(0.85)
      expect(item.quantity).to eq(3)
    end
    
    it 'returns nil for invalid format' do
      expect(InputParser.parse_to_item("invalid format")).to be_nil
      expect(InputParser.parse_to_item("book at 12.49")).to be_nil
      expect(InputParser.parse_to_item("2 book 12.49")).to be_nil
    end
  end
  
  describe '.parse_multiple' do
    # TODO: add tests
  end
end
