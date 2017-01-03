module PayslipGenerator
  class Runner
    def initialize(employee_reader:, payslip_writer:, tax_brackets:)
      @employee_reader = employee_reader
      @payslip_writer = payslip_writer
      @tax_brackets = tax_brackets
    end

    def run
      employee_reader.each do |employee|
        payslip_writer << Factories::Payslip.create(
          employee: employee,
          tax_calculator: tax_calculator(employee)
        )
      end
    ensure
      payslip_writer.close
    end

    private

    attr_reader :employee_reader, :payslip_writer, :tax_brackets

    def tax_calculator(employee)
      TaxCalculator.new(
        salary: employee[:salary], tax_brackets: tax_brackets
      )
    end
  end
end
