describe PayslipGenerator::Runner do
  let(:employee_file) { File.open("spec/fixtures/employee_data.csv", "r") }
  let(:employee_reader) { PayslipGenerator::EmployeeReaders::CsvReader.new(employee_file) }
  let(:payslip_file) { Tempfile.new("payslips.csv") }
  let(:payslip_writer) { PayslipGenerator::PayslipWriters::CsvWriter.new(payslip_file) }

  subject do
    described_class.new(
      employee_reader: employee_reader, payslip_writer: payslip_writer
    )
  end

  after { employee_file.close }

  describe "#run" do
    before { subject.run }

    it "creates a csv file storing the pay information" do
      expect(CSV.foreach(payslip_file.path).to_a).to eq(
        [
          ["David", "Rudd", "01 March - 31 March", "5004", "922", "4082", "450"],
          ["Ryan", "Chen", "01 March - 31 March", "10000", "2696", "7304", "1000"]
        ]
      )
    end
  end
end
