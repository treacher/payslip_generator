module PayslipGenerator
  module PayslipWriters
    class CsvWriter < CSV
      def <<(payslip)
        super(convert(payslip))
      end

      def convert(payslip)
        payslip.values
      end
    end
  end
end
