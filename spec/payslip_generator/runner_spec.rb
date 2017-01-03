describe PayslipGenerator::Runner do
  let(:input_path) { "spec/fixtures/employee_data.csv" }
  let(:output_path) { "spec/fixtures/employee_payslips.csv" }

  subject do
    described_class.new(
      input_path: input_path,
      output_path: output_path
    )
  end

  describe "#run" do
    before { subject.run }

    it "creates a csv file storing the pay information" do
      expect(Ccsv.foreach(output_path)).to yield_successive_args(
        ["David", "Rudd", "01 March – 31 March", 5004, 922, 4082, 450],
        ["Ryan", "Chen", "01 March – 31 March", 10000, 2696, 7304, 1000]
      )
    end
  end
end
