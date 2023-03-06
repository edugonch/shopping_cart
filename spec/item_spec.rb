require_relative '../item'

describe Item do
  describe '#initialize' do
    it 'creates an item with the correct attributes' do
      item = Item.new(2, 'book', 12.49, 0)

      expect(item.quantity).to eq(2)
      expect(item.name).to eq('book')
      expect(item.price).to eq(12.49)
      expect(item.tax).to eq(0)
    end
  end
end