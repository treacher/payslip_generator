module PayslipGenerator
  class PayslipFactory
    class << self
      def create(employee_attrs:, tax_calculator:)
        salary = employee_attrs.delete(:salary)
        super_rate = employee_attrs.delete(:super_rate)

        employee_attrs.merge(
          gross_income: gross_income(salary),
          income_tax: income_tax(tax_calculator),
          net_income: net_income(salary, tax_calculator),
          superannuation: superannuation(salary, tax_calculator, super_rate)
        )
      end

      def gross_income(salary)
        (salary / months_in_a_year).round
      end

      def income_tax(tax_calculator)
        (tax_calculator.calculate / months_in_a_year).round
      end

      def net_income(salary, tax_calculator)
        gross_income(salary) - income_tax(tax_calculator)
      end

      def superannuation(salary, tax_calculator, super_rate)
        (net_income(salary, tax_calculator) * super_rate).round
      end

      def months_in_a_year
        12
      end
    end
  end
end
