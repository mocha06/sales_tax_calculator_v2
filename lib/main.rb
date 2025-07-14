require_relative 'input_parser'
require_relative 'receipt'

class SalesTaxCalculator
  CHALLENGE_EXAMPLES = {
    1 => [
      "2 book at 12.49",
      "1 music CD at 14.99", 
      "1 chocolate bar at 0.85"
    ],
    2 => [
      "1 imported box of chocolates at 10.00",
      "1 imported bottle of perfume at 47.50"
    ],
    3 => [
      "1 imported bottle of perfume at 27.99",
      "1 bottle of perfume at 18.99",
      "1 packet of headache pills at 9.75",
      "3 imported boxes of chocolates at 11.25"
    ]
  }.freeze

  def self.run
    case
    when ARGV.include?('--bulk')
      run_bulk_mode
    when ARGV.include?('--interactive')
      run_interactive_mode
    else
      run_example_mode
    end
  end

  private

  def self.run_bulk_mode
    display_bulk_instructions
    items = collect_items_from_input
    display_receipt(items)
  end

  def self.run_interactive_mode
    display_interactive_instructions
    items = collect_items_interactively
    display_receipt(items)
  end

  def self.run_example_mode
    puts "Sales Tax Calculator - Challenge Examples"
    puts "=" * 50

    CHALLENGE_EXAMPLES.each_with_index do |(example_num, input_lines), index|
      run_challenge_example(example_num, input_lines)
      puts "\n" + "=" * 50 + "\n" unless index == CHALLENGE_EXAMPLES.length - 1
    end
  end

  def self.run_challenge_example(example_num, input_lines)
    puts "Input #{example_num}:"
    puts input_lines.join("\n")
    puts "\nOutput #{example_num}:"
    
    items = parse_input_lines(input_lines)
    display_receipt(items)
  end

  def self.display_bulk_instructions
    puts "Sales Tax Calculator - Bulk Mode"
    puts "Enter all items (one per line, empty line to finish)"
    puts "Example:"
    puts "1 imported bottle of perfume at 27.99"
    puts "1 bottle of perfume at 18.99"
    puts "1 packet of headache pills at 9.75"
    puts "3 imported boxes of chocolates at 11.25"
    puts ""
    puts "Enter your items (empty line to finish):"
  end

  def self.display_interactive_instructions
    puts "Sales Tax Calculator - Interactive Mode"
    puts "Enter item (format: quantity item_name at price)"
    puts "Example: 2 book at 12.49"
    puts "Enter 'done' to finish"
    puts ""
  end

  def self.collect_items_from_input
    items = []
    
    loop do
      input = STDIN.gets&.chomp
      break if input.nil? || input.empty?
      
      process_input_line(input, items)
    end

    items
  end

  def self.collect_items_interactively
    items = []

    loop do
      print "Enter item: "
      input = STDIN.gets.chomp
      break if input.downcase == 'done'

      process_input_line(input, items)
    end

    items
  end

  def self.process_input_line(input, items)
    item = InputParser.parse_to_item(input)
    
    if item
      items << item
      puts "Added: #{item.quantity} #{item.name} at #{item.price}"
    else
      puts "Invalid input format: #{input}"
    end
  end

  def self.parse_input_lines(input_lines)
    input_lines.map { |line| InputParser.parse_to_item(line) }.compact
  end

  def self.display_receipt(items)
    if !items.empty?
      receipt = Receipt.new(items)
      puts receipt.formatted_output
    else
      puts "No items added to receipt."
    end
  end
end

SalesTaxCalculator.run

