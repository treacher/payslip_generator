describe PayslipGenerator::PayslipFactory do
  let(:employee_attrs) do
    {
      first_name: "Michael",
      last_name: "Treacher",
      salary: BigDecimal.new("150000"),
      super_rate: 0.09,
      pay_period: "01 March - 31 March"
    }
  end

  let(:tax) { BigDecimal.new("50000") }

  let(:tax_calculator) { double(:tax_calculator, calculate: tax) }
  let(:expected_payslip) do
    {
      first_name: "Michael",
      last_name: "Treacher",
      pay_period: "01 March - 31 March",
      gross_income: 125_00,
      income_tax: 4167,
      net_income: 8333,
      superannuation: 750
    }
  end

  subject do
    described_class.create(
      employee_attrs: employee_attrs,
      tax_calculator: tax_calculator
    )
  end

  describe ".create" do
    it "returns a payslip hash" do
      expect(subject).to eq expected_payslip
    end
  end
end
