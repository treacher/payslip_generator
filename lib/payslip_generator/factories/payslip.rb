module PayslipGenerator
  module Factories
    class Payslip
      class << self
        def create(employee:, tax_calculator:)
          salary = employee[:salary]
          super_rate = employee[:super_rate]

          {
            full_name: full_name(employee),
            pay_period: employee[:pay_period],
            gross_income: gross_income(salary),
            income_tax: income_tax(tax_calculator),
            net_income: net_income(salary, tax_calculator),
            superannuation: superannuation(salary, super_rate)
          }
        end

        def full_name(employee)
          "#{employee[:first_name]} #{employee[:last_name]}"
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

        def superannuation(salary, super_rate)
          (gross_income(salary) * super_rate).round
        end

        def months_in_a_year
          12
        end
      end
    end
  end
end
