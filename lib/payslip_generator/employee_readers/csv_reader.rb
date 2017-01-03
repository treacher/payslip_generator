module PayslipGenerator
  module EmployeeReaders
    class CsvReader
      class << self
        def read(file_path)
          employees = []

          Ccsv.foreach(file_path) do |row|
            employees << {
              first_name: row[0], last_name: row[1],
              salary: BigDecimal.new(row[2]),
              super_rate: row[3].to_f, pay_period: row[4]
            }
          end

          employees
        end
      end
    end
  end
end
