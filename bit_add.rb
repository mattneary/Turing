require './turing.rb'

ruleset = []
ruleset.push Rule.new(?A, 0, 0, ?R, ?Z)
ruleset.push Rule.new(?A, 1, 1, ?R, ?C)

ruleset.push Rule.new(?Z, 0, 0, ?R, ?H)
ruleset.push Rule.new(?Z, 1, 1, ?L, ?N)

ruleset.push Rule.new(?C, 0, 1, ?L, ?N)
ruleset.push Rule.new(?C, 1, 0, ?L, ?Y)

ruleset.push Rule.new(?N, 1, 0, ?R, ?H)
ruleset.push Rule.new(?Y, 0, 1, ?R, ?H)

ruleset.push Rule.new(?N, 0, 0, ?R, ?H)
ruleset.push Rule.new(?Y, 1, 1, ?R, ?H)

p TuringMachine.new(ruleset, [1, 1]).iterate.tape
