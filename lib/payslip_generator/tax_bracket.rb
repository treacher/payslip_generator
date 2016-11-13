module PayslipGenerator
  class TaxBracket
    def initialize(range:, multiplier:)
      @range = range
      @multiplier = multiplier
    end

    def calculate_tax_for(salary:)
      return salary * 0 if salary < range.min

      max = salary > range.max ? range.max : salary
      (max - range.min) * multiplier
    end

    private

    attr_reader :range, :multiplier
  end
end
