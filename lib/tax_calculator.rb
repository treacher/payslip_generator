# frozen_string_literal: true
class TaxCalculator
  def initialize(salary:, tax_brackets:)
    @salary = salary
    @tax_brackets = tax_brackets
  end

  def calculate
    tax_brackets.inject(salary * 0) do |sum, bracket|
      sum + bracket.calculate_tax_for(salary: salary)
    end
  end

  private

  attr_reader :salary, :tax_brackets
end
