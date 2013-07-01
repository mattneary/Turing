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
		@tape = tape.split(/\s/)
		while (line = file.gets)
			parts = line.split /\s/
			if parts.length > 5
				raise "Invalid rule input."
			else
				@rules.push Rule.new(*parts)
			end
		end
		file.close
	end
end
class TuringMachine
	attr_accessor :rules, :tape, :index, :state
	def char_match(a, b)
		a == '_' or a == b
	end
	def iterate
		rule = @rules.select { |rule|
			char_match(rule.state, @state) and char_match(rule.symbol, @tape[@index])
		}.first
		@tape[@index] = rule.new_symbol
		@index += rule.direction == 'R' ? 1 : (rule.direction == 'L' ? -1 : 0)
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
	def print
		p @tape.map { |x|
			Integer x
		}
	end
end

if ARGV.length > 0
	filename = ARGV.first.chomp
else
	raise "No input file provided."
end

ruleset = ActionTable.new(filename)
TuringMachine.new(ruleset.rules, ruleset.tape).iterate.print
