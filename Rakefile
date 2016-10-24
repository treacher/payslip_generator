# frozen_string_literal: true

begin
  require "rspec/core/rake_task"
  require "rubocop/rake_task"

  RSpec::Core::RakeTask.new(:spec)
  RuboCop::RakeTask.new

  task default: [:spec, :rubocop]
rescue LoadError
  puts "Failed to load"
end
