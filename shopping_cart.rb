require_relative 'item'
require_relative 'sales_tax_calculator'

class ShoppingCart
  def initialize
    @items = []
    @exempt_categories = {
      books: ['book'],
      food: ['chocolate'],
      medical: ['pill']
      # add any other exempt categories and items here
    }
    @tax_calculator = SalesTaxCalculator.new(@exempt_categories)
  end

  def add(item)
    quantity, name, price = parse_item(item)
    tax = @tax_calculator.calculate_tax(name, price)
    @items << Item.new(quantity, name, price, tax)
  rescue ArgumentError => e
    raise ArgumentError, "Invalid item: #{e.message}"
  end

  def generate_receipt
    total_tax = @items.sum { |item| item.tax * item.quantity }
    total_price = @items.sum { |item| (item.price + item.tax) * item.quantity }

    @items.each do |item|
      puts "#{item.quantity} #{item.name}: #{format('%.2f', (item.price + item.tax) * item.quantity)}"
    end
    puts "Sales Taxes: #{format('%.2f', total_tax)}"
    puts "Total: #{format('%.2f', total_price)}"
  end

  private

  def parse_item(item)
    match = item.match(/^(\d+) (.+) at (\d+\.\d{2})$/)
    raise ArgumentError, 'Invalid input format' unless match

    quantity = match[1].to_i
    name = match[2]
    price = match[3].to_f

    [quantity, name, price]
  end
end