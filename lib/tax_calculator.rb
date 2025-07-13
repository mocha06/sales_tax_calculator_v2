class TaxCalculator
  BASIC_TAX_RATE = 0.10  # 10%
  IMPORT_TAX_RATE = 0.05  # 5%

  def self.calculate(item)
    basic_tax = calculate_basic_tax(item)
    import_tax = calculate_import_tax(item)

    total_tax = basic_tax + import_tax
    round_tax(total_tax)
  end

  private

  def self.calculate_basic_tax(item)
    return 0 if item.tax_exempt?

    item.price * BASIC_TAX_RATE
  end

  def self.calculate_import_tax(item)
    return 0 unless item.imported?

    item.price * IMPORT_TAX_RATE
  end

  def self.round_tax(tax_ammount)
    # Round up to nearest 05
    (tax_ammount * 20).ceil / 20.0
  end
end