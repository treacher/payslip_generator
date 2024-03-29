module PayslipGenerator
  class TaxBracket
    def initialize(range:, multiplier:)
      @range = range
      @multiplier = multiplier
    end

    def calculate_tax_for(salary:)
      return 0 if salary < range.min

      amount_to_tax = [salary, range.max].min - range.min
      amount_to_tax * multiplier
    end

    def ==(other)
      range == other.range && multiplier == other.multiplier
    end

    protected

    attr_reader :range, :multiplier
  end
end
