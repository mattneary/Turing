class Rule
	attr_accessor :state, :symbol, :new_symbol, :direction, :new_state 	
	def initialize(state, symbol, new_symbol, direction, new_state)
		@state = state
		@symbol = symbol
		@new_symbol = new_symbol 
		@direction = direction
		@new_state = new_state
	end
end
class ActionTable
	attr_accessor :rules, :tape
	def initialize(file)
		@rules = []

		file = File.new(file, "r")

		tape = file.gets
		@tape = tape.split(/\s/).map { |value|
			Integer value
		}

		while (line = file.gets)
			parts = line.split /\s/
			if parts.length > 5
				raise "Invalid rule input."
			else
				@rules.push Rule.new(
					parts[0], 
					Integer(parts[1]), 
					Integer(parts[2]), 
					parts[3], 
					parts[4])
			end
		end
		file.close
	end
end
class TuringMachine
	attr_accessor :rules, :tape, :index, :state
	def iterate
		rule = @rules.select { |rule|
			rule.state == @state and rule.symbol == @tape[@index]
		}.first
		@tape[@index] = rule.new_symbol
		@index += rule.direction == 'R' ? 1 : -1
		@state = rule.new_state
		if @state != 'H'
			self.iterate
		else
			self
		end
	end
	def initialize(ruleset, tape)
		@rules = ruleset
		@tape = tape
		@state = 'A'
		@index = 0
	end
end

if ARGV.length > 0
	filename = ARGV.first.chomp
else
	raise "No input file provided."
end

ruleset = ActionTable.new(filename)
p TuringMachine.new(ruleset.rules, ruleset.tape).iterate.tape
