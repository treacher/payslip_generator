# frozen_string_literal: true
require "spec_helper"
require "bigdecimal"
require "./lib/tax_bracket"

describe TaxBracket do
  context "tax bracket with a range and a multiplier" do
    subject { TaxBracket.new(range: 1001..2000, multiplier: 0.5) }

    context "salary is above the range" do
      let(:salary) { BigDecimal.new("112500.50") }
      let(:expected_tax) { BigDecimal.new("499.50") }

      it "returns the expected tax amount" do
        expect(subject.calculate_tax_for(salary: salary)).to eq expected_tax
      end
    end

    context "salary is within the range" do
      let(:salary) { BigDecimal.new("1500.50") }
      let(:expected_tax) { BigDecimal.new("249.75") }

      it 'returns the expected tax amount' do
        expect(subject.calculate_tax_for(salary: salary)).to eq expected_tax
      end
    end

    context "salary is below the range" do
      let(:salary) { BigDecimal.new("400.50") }
      let(:expected_tax) { BigDecimal.new("0.00") }

      it "returns the expected tax amount" do
        expect(subject.calculate_tax_for(salary: salary)).to eq expected_tax
      end
    end
  end
end
