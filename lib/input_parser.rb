require 'pry'
require_relative 'item'


class InputParser
  INPUT_SEPARATOR = ' at '.freeze

  def self.parse(input_line)
    parts = input_line.strip.split(INPUT_SEPARATOR)

    return nil if parts.length != 2

    quantity_and_name = parts[0]
    price = parts[1].to_f

    quantity, name = extract(quantity_and_name)

    return nil unless (quantity && name)

    Item.new(name, price, quantity)
  end

  def self.parse_multiple;end # TODO: implement this

  private

  LINE_ITEM_REGEX = /^(\d+)\s+(.+)$/.freeze

  def self.extract(quantity_and_name)
    quantity_match = quantity_and_name.match(LINE_ITEM_REGEX)

    return nil unless quantity_match

    quantity = quantity_match[1].to_i
    name = quantity_match[2].strip

    [quantity, name]
  end
end

