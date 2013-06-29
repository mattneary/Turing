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
class TuringMachine
	attr_accessor :rules, :tape, :index, :state
	def iterate
		rule = @rules.select { |rule|
			rule.state == @state and rule.symbol == @tape[@index]
		}.first
		@tape[@index] = rule.new_symbol
		@index += rule.direction == ?R ? 1 : -1
		@state = rule.new_state
		if @state != ?H
			self.iterate
		else
			self
		end
	end
	def initialize(ruleset, tape)
		@rules = ruleset
		@tape = tape
		@state = ?A
		@index = 0
	end
end
