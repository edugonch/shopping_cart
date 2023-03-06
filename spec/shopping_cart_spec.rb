require 'spec_helper'
require_relative '../shopping_cart'

describe ShoppingCart do
  describe '#add' do
    it 'adds items to the cart' do
      cart = ShoppingCart.new
      cart.add('1 book at 12.49')
      cart.add('1 music CD at 14.99')
      cart.add('1 chocolate bar at 0.85')

      expect(cart.instance_variable_get(:@items).size).to eq(3)
    end

    it 'raises an error for invalid input format' do
      cart = ShoppingCart.new
      expect { cart.add('invalid input') }.to raise_error(ArgumentError, 'Invalid item: Invalid input format')
    end

    it 'raises an error for unknown item' do
      cart = ShoppingCart.new
      expect { cart.add('1 unknown item at 10.0') }.to raise_error(ArgumentError, 'Invalid item: Invalid input format')
    end
  end

  describe '#generate_receipt' do
    it 'outputs the correct receipt for the first example input' do
      cart = ShoppingCart.new
      cart.add('2 book at 12.49')
      cart.add('1 music CD at 14.99')
      cart.add('1 chocolate bar at 0.85')

      expect { cart.generate_receipt }.to output(
                                            "2 book: 24.98\n" \
                                            "1 music CD: 16.49\n" \
                                            "1 chocolate bar: 0.85\n" \
                                            "Sales Taxes: 1.50\n" \
                                            "Total: 42.32\n"
                                          ).to_stdout
    end

    it 'outputs the correct receipt for the second example input' do
      cart = ShoppingCart.new
      cart.add('1 imported box of chocolates at 10.00')
      cart.add('1 imported bottle of perfume at 47.50')

      expect { cart.generate_receipt }.to output(
                                            "1 imported box of chocolates: 10.50\n" \
                                            "1 imported bottle of perfume: 54.65\n" \
                                            "Sales Taxes: 7.65\n" \
                                            "Total: 65.15\n"
                                          ).to_stdout
    end

    it 'outputs the correct receipt for the third example input' do
      cart = ShoppingCart.new
      cart.add('1 imported bottle of perfume at 27.99')
      cart.add('1 bottle of perfume at 18.99')
      cart.add('1 packet of headache pills at 9.75')
      cart.add('3 imported boxes of chocolates at 11.25')

      expect { cart.generate_receipt }.to output(
                                            "1 imported bottle of perfume: 32.19\n" \
                                            "1 bottle of perfume: 20.89\n" \
                                            "1 packet of headache pills: 9.75\n" \
                                            "3 imported boxes of chocolates: 35.55\n" \
                                            "Sales Taxes: 7.90\n" \
                                            "Total: 98.38\n"
                                          ).to_stdout
    end
  end
end