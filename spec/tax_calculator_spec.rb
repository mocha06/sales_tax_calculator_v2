require_relative '../lib/tax_calculator'
require_relative '../lib/item'

RSpec.describe TaxCalculator do
  describe '.calculate' do
    let(:item) { Item.new(item_name, price, quantity) }

    describe 'tax exemptions' do
      let(:price) { 12.49 }
      let(:quantity) { 1 }

      context 'when tax exempt items' do
        let(:item_name) { "book" }

        it 'calculates 0 tax on item' do
          expect(TaxCalculator.calculate(item)).to eq(0)
        end
      end

      context 'when non-tax exempt items' do
        let(:item_name) { "music CD" }
        let(:price) { 14.99 } 

        it 'calculates basic tax (10%)' do
          # 14.99 * 0.10 = 1.499, rounded up to 1.50
          expect(TaxCalculator.calculate(item)).to eq(1.50)
        end
      end
    end
  end
end