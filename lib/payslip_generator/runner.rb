module PayslipGenerator
  class Runner
    def initialize(employee_reader:, payslip_writer:, country: :au)
      @employee_reader = employee_reader
      @payslip_writer = payslip_writer
      @country = country
    end

    def run
      employee_reader.each do |employee|
        payslip_writer << Factories::Payslip.create(
          employee_attrs: employee,
          tax_calculator: tax_calculator(employee)
        )
      end
    ensure
      payslip_writer.close
    end

    private

    attr_reader :employee_reader, :payslip_writer, :country

    def tax_calculator(employee)
      TaxCalculator.new(
        salary: employee[:salary], tax_brackets: tax_brackets
      )
    end

    def tax_brackets
      Factories::TaxBracket.create(
        brackets: YAML.load_file("config/tax_brackets/#{country}.yml")
      )
    end
  end
end
