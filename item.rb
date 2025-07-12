class Item
  attr_reader :name, :price, :quantity, :imported

  def initialize(name, price, quantity)
    @name = name
    @price = price.to_f
    @quantity = quantity.to_i
  end

  def imported?
    name.downcase.include? "imported"
  end

  def tax_exempt?
    TaxExemptionChecker.tax_exempt?(name)
  end

  def calculate_tax
    TaxCalculator.calculate(self)
  end
end

class TaxExemptionChecker
  EXEMPT_ITEMS = ['book', 'chocolate bar', 'chocolates', 'headache pills', 'pills']

  def self.tax_exempt?(item_name)
    EXEMPT_ITEMS.any? { |exempt_item| item_name.downcase.include? exempt_item }
  end
end


class TaxCalculator
  def self.calculate(item)
  end
end