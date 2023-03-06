class SalesTaxCalculator
  SALES_TAX_RATE = 0.1
  IMPORT_DUTY_RATE = 0.05
  ROUNDING_PRECISION = 20.0

  def initialize(exempt_categories)
    @exempt_categories = exempt_categories
  end

  def calculate_tax(name, price)
    tax = 0

    tax += price * SALES_TAX_RATE unless exempt_from_sales_tax?(name)

    tax += price * IMPORT_DUTY_RATE if name.include?('imported')

    round_tax(tax)
  end

  private

  def exempt_from_sales_tax?(name)
    @exempt_categories.values.flatten.any? { |category| name.include?(category) }
  end

  def round_tax(tax)
    (tax * ROUNDING_PRECISION).ceil / ROUNDING_PRECISION
  end
end