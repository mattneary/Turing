Turing
======
Turing is a Turing Machine simulator written in Ruby. A Turing Machine consists of the following.

1. A **tape** divided into cells, each cell containing a symbol, extensible to arbitrary size.
2. A **head** that can read and write symbols on the tape and move along the tape.
3. A **state register** which stores the state of the machine. A state is one of a finite array of states, with a distinct initial state value of 'A' and a special halting state value of 'H'.
4. An **action table** mapping a current state and current symbol to a new symbol, new state, and movement either left or right.

Usage
-----
The action table of a Turing Machine is provided in a `.turing` file; the format is defined as *action table* in the following (n.b., [Backus-Naur Form](https://en.wikipedia.org/wiki/Backus–Naur_Form) is used).

	<action table> ::= <tape> <EOL> <ruleset>
	<ruleset> ::= <rule> | <ruleset> <EOL> <rule>
	<tape> ::= <symbol> | <tape> " " <symbol>	
	
	<rule> ::= <state> " " <symbol> " " <symbol> " " <direction> " " <state>
	<state> ::= A | B | ... | <wildcard>
	<symbol> ::= 0 | 1 | <wildcard>
	<direction> ::= R | L		
	<wildcard> ::= _	

You should note that the second *symbol* and *state* in a rule are the new values each register takes. The first line is dedicated to an initial tape value, and an underscore is used as a wildcard.

Once a valid `.turing` file has been made, pass the filename as an argument to __turing.rb__. As an example, you could do the following.

```bash
ruby turing.rb bit_add.turing
```

Purpose
-------
Turing will continue to be built out as a tool for working with Turing Machines and most likely joined with a generic Automata project. Dealing with Turing Machines is a great way to understand computers on a fundamental level, an effort which this project aims to facilitate.