module PayslipGenerator
  module Factories
    class TaxBracket
      class << self
        def create(brackets:)
          brackets.map do |bracket|
            max = bracket["max"]
            max = Float::INFINITY if max == -1

            PayslipGenerator::TaxBracket.new(
              range: bracket["min"]..max,
              multiplier: bracket["multiplier"]
            )
          end
        end
      end
    end
  end
end
