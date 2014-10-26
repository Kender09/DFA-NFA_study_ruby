#p98, 99
require './class_4'

rulebook = NFARulebook.new([
	FARule.new(1, 'a', 1), FARule.new(1, 'a', 2), FARule.new(1, nil, 2),
	FARule.new(2, 'b', 3),
	FARule.new(3, 'b', 1), FARule.new(3, nil, 2)
])

p nfa_design = NFADesign.new(1, [3], rulebook)
p nfa_design.to_nfa.current_states
p nfa_design.to_nfa(Set[2]).current_states
p nfa_design.to_nfa(Set[3]).current_states

p nfa = nfa_design.to_nfa(Set[2, 3])
nfa.read_character('b')
p nfa.current_states

p simulation = NFASimulation.new(nfa_design)
p simulation.next_state(Set[1, 2], 'a')
p simulation.next_state(Set[1, 2], 'b')
p simulation.next_state(Set[3, 2], 'b')
p simulation.next_state(Set[1, 3, 2], 'b')
p simulation.next_state(Set[1, 3, 2], 'a')

#p100
p rulebook.alphabet
p simulation.rules_for(Set[1, 2])
p simulation.rules_for(Set[3, 2])
