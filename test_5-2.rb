#p101, 102
require './class_4'

rulebook = NFARulebook.new([
	FARule.new(1, 'a', 1), FARule.new(1, 'a', 2), FARule.new(1, nil, 2),
	FARule.new(2, 'b', 3),
	FARule.new(3, 'b', 1), FARule.new(3, nil, 2)
])

nfa_design = NFADesign.new(1, [3], rulebook)
simulation = NFASimulation.new(nfa_design)

p start_state = nfa_design.to_nfa.current_states
p simulation.discover_states_and_rules(Set[start_state])

p nfa_design.to_nfa(Set[1, 2]).accepting?
p nfa_design.to_nfa(Set[2, 3]).accepting?

p dfa_design = simulation.to_dfa_design
p dfa_design.accepts?('aaa')
p dfa_design.accepts?('aab')
p dfa_design.accepts?('bbbabb')