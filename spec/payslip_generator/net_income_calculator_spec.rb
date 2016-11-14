describe PayslipGenerator::NetIncomeCalculator do
  let(:tax_amount) { BigDecimal.new("4000") }
  let(:salary) { BigDecimal.new("10000") }

  let(:tax_calculator) do
    double(:tax_calculator, calculate: tax_amount)
  end

  subject do
    described_class.new(salary: salary, tax_calculator: tax_calculator)
  end

  describe "#calculate" do
    it "returns the net income" do
      expect(subject.calculate).to eq BigDecimal.new("6000")
    end
  end
end
