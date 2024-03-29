require './class_2'

rulebook = NFARulebook.new([
	FARule.new(1, 'a', 1), FARule.new(1, 'b', 1), FARule.new(1, 'b', 2),
	FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
	FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
])

nfa = NFA.new(Set[1], [4], rulebook)
p nfa.accepting?
nfa.read_character('b')
p nfa.accepting?
nfa.read_character('a')
p nfa.accepting?
nfa.read_character('b')
p nfa.accepting?

p nfa = NFA.new(Set[1], [4], rulebook)
p nfa.accepting?
nfa.read_string('bbbbb')
p nfa.accepting?
