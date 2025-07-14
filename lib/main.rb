require_relative 'input_parser'
require_relative 'receipt'
require 'pry'

class SalesTaxCalculator
  def self.run
    if ARGV.include? '--bulk'
      puts "COMING SOON"
      # TODO: run_bulk_mode
    elsif ARGV.include? '--interactive'
      run_interactive_mode
    else
      run_example_mode
    end
  end

  private

  def self.run_interactive_mode
    puts "Sales Tax Calculator - Interactive Mode"
    puts "Enter item (format: quantity item_name at price)"
    puts "Example: 2 book at 12.49"
    puts "Enter 'done' to finish"
    puts ""

    items = []

    loop do
      print "Enter item: "
      input = STDIN.gets.chomp

      break if input.downcase == 'done'

      item = InputParser.parse_to_item(input)

      if item
        items << item
        puts "Added: #{item.quantity} #{item.name} at #{item.price}"
      else
        puts "Invalid input format. Please try again."
      end
    end

    if !items.empty?
      receipt = Receipt.new(items)
      puts "\nReceipt:"
      puts receipt.formatted_output
    else
      puts "No items added to receipt."
    end
  end

  def self.run_example_mode
    puts "Sales Tax Calculator - Challenge Examples"
    puts "=" * 50

    run_example_1
    puts "\n" + "=" * 50 + "\n"

    run_example_2
    puts "\n" + "=" * 50 + "\n"

    run_example_3
  end

  def self.run_example_1
    puts "Input 1:"
    input = [
      "2 book at 12.49",
      "1 music CD at 14.99", 
      "1 chocolate bar at 0.85"
    ]

    puts input.join("\n")
    puts "\nOutput 1:"
    
    items = input.map { |line| InputParser.parse_to_item(line) }.compact
    receipt = Receipt.new(items)
    puts receipt.formatted_output
  end

  def self.run_example_2
    puts "Input 2:"
    input = [
      "1 imported box of chocolates at 10.00",
      "1 imported bottle of perfume at 47.50"
    ]

    puts input.join("\n")
    puts "\nOutput 2:"

    items = input.map { |line| InputParser.parse_to_item(line) }.compact
    receipt = Receipt.new(items)
    puts receipt.formatted_output
  end

  def self.run_example_3
    puts "Input 3:"
    input = [
      "1 imported bottle of perfume at 27.99",
      "1 bottle of perfume at 18.99",
      "1 packet of headache pills at 9.75",
      "3 imported boxes of chocolates at 11.25"
    ]

    puts input.join("\n")
    puts "\nOutput 3:"

    items = input.map { |line| InputParser.parse_to_item(line) }.compact
    receipt = Receipt.new(items)
    puts receipt.formatted_output
  end
end

SalesTaxCalculator.run

