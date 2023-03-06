require_relative 'shopping_cart'

cart = ShoppingCart.new

loop do
  print 'Enter an item (or press enter to finish): '
  input = gets.chomp
  break if input.empty?

  begin
    cart.add(input)
  rescue ArgumentError => e
    puts "Invalid input: #{e.message}"
  end
end

cart.generate_receipt