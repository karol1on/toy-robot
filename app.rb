# frozen_string_literal: true

require_relative 'lib/simulation'

instructions = File.readlines('input.txt')
simulator = Simulation.new

instructions.each do |inst|
  output = simulator.evaluate(inst.strip)
  puts output if inst.include?('REPORT')
end
