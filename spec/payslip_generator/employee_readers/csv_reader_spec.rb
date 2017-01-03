describe PayslipGenerator::EmployeeReaders::CsvReader do
  let(:csv_file) { File.open("spec/fixtures/employee_data.csv", "r") }

  let(:employee_1) do
    {
      first_name: "David",
      last_name: "Rudd",
      salary: BigDecimal.new("60050"),
      super_rate: 0.09,
      pay_period: "01 March - 31 March"
    }
  end

  let(:employee_2) do
    {
      first_name: "Ryan",
      last_name: "Chen",
      salary: BigDecimal.new("120000"),
      super_rate: 0.10,
      pay_period: "01 March - 31 March"
    }
  end

  subject { described_class.new(csv_file) }

  describe "#each" do
    it "enumerates the employees in the correct format" do
      expect do |b|
        subject.each(&b)
      end.to yield_successive_args(employee_1, employee_2)
    end
  end
end
