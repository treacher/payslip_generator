module PayslipGenerator
  module EmployeeReaders
    class CsvReader < CSV
      def each(&block)
        super { |row| yield(convert(row)) }
      end

      def convert(row)
        {
          first_name: row[0],
          last_name: row[1],
          salary: BigDecimal.new(row[2]),
          super_rate: row[3].to_f,
          pay_period: row[4]
        }
      end
    end
  end
end
