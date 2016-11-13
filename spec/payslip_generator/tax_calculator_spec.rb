describe PayslipGenerator::TaxCalculator do
  let(:salary) { BigDecimal.new("100000.50") }
  let(:tax_brackets) do
    [
      double("Bracket", calculate_tax_for: bracket_tax),
      double("Bracket", calculate_tax_for: BigDecimal.new("500.00")),
      double("Bracket", calculate_tax_for: BigDecimal.new("750.00"))
    ]
  end

  subject { described_class.new(salary: salary, tax_brackets: tax_brackets) }

  describe "#calculate" do
    context "rounds up" do
      let(:bracket_tax) { BigDecimal.new("100.50") }
      let(:expected_output) { BigDecimal.new("1351.00") }

      it "returns the sum of tax from all the tax brackets" do
        expect(subject.calculate).to eq expected_output
      end
    end

    context "rounds down" do
      let(:bracket_tax) { BigDecimal.new("100.00") }
      let(:expected_output) { BigDecimal.new("1350.00") }

      it "returns the sum of tax from all the tax brackets" do
        expect(subject.calculate).to eq expected_output
      end
    end
  end
end
