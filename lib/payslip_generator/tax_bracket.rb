module PayslipGenerator
  class TaxBracket
    def initialize(range:, multiplier:)
      @range = range
      @multiplier = multiplier
    end

    def calculate_tax_for(salary:)
      return salary * 0 if salary < range.min

      amount_to_tax = [salary, range.max].min - range.min
      amount_to_tax * multiplier
    end

    private

    attr_reader :range, :multiplier
  end
end
