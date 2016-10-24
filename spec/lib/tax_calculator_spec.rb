# frozen_string_literal: true
require "spec_helper"
require "bigdecimal"
require "./lib/tax_calculator"

describe TaxCalculator do
  let(:salary) { BigDecimal.new("100000.50") }
  let(:tax_brackets) do
    [
      double("Bracket_1", calculate_tax_for: BigDecimal.new("50.00")),
      double("Bracket_2", calculate_tax_for: BigDecimal.new("300.00")),
      double("Bracket_3", calculate_tax_for: BigDecimal.new("1000.00"))
    ]
  end

  subject { TaxCalculator.new(salary: salary, tax_brackets: tax_brackets) }

  describe "calculate" do
    let(:expected_output) { BigDecimal.new("1350.00") }

    it "returns the sum of tax from all the tax brackets" do
      expect(subject.calculate).to eq expected_output
    end
  end
end
