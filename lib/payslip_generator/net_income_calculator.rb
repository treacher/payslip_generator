module PayslipGenerator
  class NetIncomeCalculator
    def initialize(salary:, tax_calculator:)
      @salary = salary
      @tax_calculator = tax_calculator
    end

    def calculate
      salary - tax_calculator.calculate
    end

    private

    attr_reader :salary, :tax_calculator
  end
end
