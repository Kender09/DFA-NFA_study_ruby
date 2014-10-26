require './class_1'

rulebook = DFARulebook.new([
	FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
	FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
	FARule.new(3, 'a', 3), FARule.new(3, 'b', 3)
])
p rulebook.inspect

p rulebook.next_state(1, 'a')
p rulebook.next_state(1, 'b')
p rulebook.next_state(2, 'b')

p DFA.new(1, [1, 3], rulebook).accepting?
p DFA.new(1, [3], rulebook).accepting?
