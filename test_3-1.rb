require './class_2'

p rulebook = NFARulebook.new([
	FARule.new(1, nil, 2), FARule.new(1, nil, 4),
	FARule.new(2, 'a', 3), 
	FARule.new(3, 'a', 2),
	FARule.new(4, 'a', 5), 
	FARule.new(5, 'a', 6),
	FARule.new(6, 'a', 4),   
])

p rulebook.next_states(Set[1], nil)

p rulebook.follow_free_moves(Set[1])

p nfa_design = NFADesign.new(1, [2, 4], rulebook)
p nfa_design.accepts?('aa')
p nfa_design.accepts?('aaa')
p nfa_design.accepts?('aaaaa')
p nfa_design.accepts?('aaaaaa')
