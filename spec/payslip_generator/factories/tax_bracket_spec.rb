describe PayslipGenerator::Factories::TaxBracket do
  let(:brackets) { YAML.load_file("spec/fixtures/tax_brackets.yml") }
  let(:expected_tax_brackets) do
    [
      PayslipGenerator::TaxBracket.new(range: 0..18_200, multiplier: 0.0),
      PayslipGenerator::TaxBracket.new(range: 18_201..180_000, multiplier: 0.19),
      PayslipGenerator::TaxBracket.new(range: 180_001..Float::INFINITY, multiplier: 0.45)
    ]
  end

  subject { described_class.create(brackets: brackets) }

  describe ".create" do
    it "creates tax brackets from the yaml file" do
      expect(subject).to eq(expected_tax_brackets)
    end
  end
end
