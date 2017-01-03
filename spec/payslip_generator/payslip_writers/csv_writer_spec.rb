describe PayslipGenerator::PayslipWriters::CsvWriter do
  let(:csv_file) { Tempfile.new("payslips.csv") }
  let(:payslip) do
    {
      first_name: "Michael",
      last_name: "Treacher",
      pay_period: "01 March - 31 March",
      gross_income: 12_500,
      income_tax: 4167,
      net_income: 8333,
      superannuation: 1125
    }
  end

  subject { described_class.new(csv_file) }

  describe "#<<" do
    before do
      subject << payslip
      subject.close
    end

    it "prints all of the payslips to a csv file" do
      expect(CSV.foreach(csv_file.path).to_a).to eq(
        [["Michael", "Treacher", "01 March - 31 March", "12500", "4167", "8333", "1125"]]
      )
    end
  end
end
