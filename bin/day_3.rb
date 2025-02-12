#! ruby

require_relative '../lib/computer/instruction_cleaner'
require_relative '../lib/computer/instruction_parser'
require_relative '../lib/computer/interpreter'


memory = File.read(File.expand_path("../input/day_3", File.dirname(__FILE__)))

raw_instructions = InstructionCleaner.new(raw_memory: memory).instructions
instructions = InstructionParser.instructions(raw_instructions: raw_instructions)

result = Interpreter.new(instructions: instructions).result

puts "Sum: #{result}"