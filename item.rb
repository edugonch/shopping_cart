class Item
  attr_reader :quantity, :name, :price, :tax

  def initialize(quantity, name, price, tax)
    @quantity = quantity
    @name = name
    @price = price
    @tax = tax
  end
end