describe PayslipGenerator::EmployeeReaders::CsvReader do
  let(:csv_path) { "spec/fixtures/employee_data.csv" }
  let(:expected_output) do
    [
      {
        first_name: "David",
        last_name: "Rudd",
        salary: BigDecimal.new("60050"),
        super_rate: 0.09,
        pay_period: "01 March - 31 March"
      },
      {
        first_name: "Michael",
        last_name: "Treacher",
        salary: BigDecimal.new("150000"),
        super_rate: 0.10,
        pay_period: "01 March - 31 March"
      }
    ]
  end

  describe "#read" do
    it "returns all the employees as an array of hashes" do
      expect(described_class.read(csv_path)).to eq expected_output
    end
  end
end
