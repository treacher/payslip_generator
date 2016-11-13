$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"
require "payslip_generator"

SimpleCov.minimum_coverage 100
SimpleCov.start
