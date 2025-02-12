#! ruby

require_relative '../lib/instruction_cleaner'
require_relative '../lib/mul_instruction'

memory = File.read(File.expand_path("../input/day_3", File.dirname(__FILE__)))

sum = InstructionCleaner.new(raw_memory: memory).instructions.reduce(0) do |accum, instruction|
  accum += MulInstruction.new(instruction: instruction).interp
end

puts "Sum: #{sum}"