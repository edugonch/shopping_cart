require_relative '../sales_tax_calculator'

describe SalesTaxCalculator do
  describe '#calculate_tax' do
    before do
      @exempt_categories = {
        books: ['book'],
        food: ['chocolate'],
        medical: ['pill']
      }
      @tax_calculator = SalesTaxCalculator.new(@exempt_categories)
    end

    it 'calculates the correct tax for a taxable item' do
      expect(@tax_calculator.calculate_tax('music CD', 14.99)).to eq(1.5)
    end

    it 'does not calculate tax for an exempt item' do
      expect(@tax_calculator.calculate_tax('book', 12.49)).to eq(0)
    end

    it 'calculates import duty tax for an imported item' do
      expect(@tax_calculator.calculate_tax('imported box of chocolates', 10.0)).to eq(0.5)
    end

    it 'calculates both sales tax and import duty tax for an imported, taxable item' do
      expect(@tax_calculator.calculate_tax('imported music CD', 16.99)).to eq(2.55)
    end
  end
end