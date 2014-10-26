require './class_1'

rulebook = DFARulebook.new([
	FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
	FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
	FARule.new(3, 'a', 3), FARule.new(3, 'b', 3)
])

# dfa = DFA.new(1, [3], rulebook); dfa.accepting?
# dfa.read_character('b'); dfa.accepting?

p dfa2 = DFA.new(1, [3], rulebook); dfa2.accepting?
p dfa2.read_string('baaab'); dfa2.accepting?
