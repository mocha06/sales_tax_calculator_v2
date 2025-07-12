require_relative 'tax_exemption_checker'
require_relative 'tax_calculator'

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
