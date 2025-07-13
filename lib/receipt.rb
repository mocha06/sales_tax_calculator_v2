class Receipt
  attr_reader :items
  
  def initialize(items)
    @items = items
  end
  
  def formatted_output
    # TODO: refactor to use service ReceiptFormatter
    output = []

    items.each do |item|
      item_total = calculate_item_total(item)
      output << formatat_item_output(item, item_total)
    end

    output << "Sales Taxes: #{format_price(total_tax)}"
    output << "Total: #{format_price(total_price)}"

    add_line_breaks_to(output)
  end
  
  private

  def calculate_item_total(item)
    item.price * item.quantity + (item.calculate_tax * item.quantity)
  end

  def formatat_item_output(item, item_total)
    "#{item.quantity} #{item.name}: #{format_price(item_total)}"
  end

  def total_tax
    # TODO: refactor to use service: ReceiptCalculator
    items.sum { |item| item.calculate_tax * item.quantity }
  end
  
  def total_price
    items.sum { |item| item.price * item.quantity + (item.calculate_tax * item.quantity) }
  end

  def format_price(price)
    # guarantees two decimal places for currency formatting
    Kernel.format("%.2f", price)
  end

  def add_line_breaks_to(output)
    output.join("\n")
  end
end