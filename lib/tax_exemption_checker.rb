class TaxExemptionChecker
  # TODO: not a class, but a module
  EXEMPT_ITEMS = ['book', 'chocolate', 'headache pills', 'pills']

  def self.tax_exempt?(item_name)
    EXEMPT_ITEMS.any? { |exempt_item| item_name.downcase.include? exempt_item }
  end
end
