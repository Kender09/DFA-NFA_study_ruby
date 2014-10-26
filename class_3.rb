#正規表現　意味論
require './class_2'
require './class_3-0'

class Empty
	def to_nfa_design
		start_state = Object.new
		accept_states = [start_state]
		rulebook = NFARulebook.new([])

		NFADesign.new(start_state, accept_states, rulebook)
	end
end

class Literal
	def to_nfa_design
		start_state = Object.new
		accept_state = Object.new
		rule = FARule.new(start_state, character, accept_state)
		rulebook = NFARulebook.new([rule])

		NFADesign.new(start_state, [accept_state], rulebook)
	end
end

class Concatenate
	def to_nfa_design
		first_nfa_design = first.to_nfa_design
		second_nfa_design = second.to_nfa_design

		start_state = first_nfa_design.start_state
		accept_states = second_nfa_design.accept_states
		rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
		extra_rules = first_nfa_design.accept_states.map { 
			|state| FARule.new(state, nil, second_nfa_design.start_state)  
		}
		rulebook = NFARulebook.new(rules + extra_rules)

		NFADesign.new(start_state, accept_states, rulebook)
	end
end

class Choose
	def to_nfa_design
		first_nfa_design = first.to_nfa_design
		second_nfa_design = second.to_nfa_design

		start_state = Object.new
		accept_states = first_nfa_design.accept_states + second_nfa_design.accept_states
		rules = first_nfa_design.rulebook.rules + second_nfa_design.rulebook.rules
		extra_rules = [first_nfa_design, second_nfa_design].map { 
			|nfa_design| FARule.new(start_state, nil, nfa_design.start_state)  
		}
		rulebook = NFARulebook.new(rules + extra_rules)

		NFADesign.new(start_state, accept_states, rulebook)
	end
end

class Repeat
	def to_nfa_design
		pattern_nfa_design = pattern.to_nfa_design

		start_state = Object.new
		accept_states = pattern_nfa_design.accept_states + [start_state]
		rules = pattern_nfa_design.rulebook.rules
		extra_rules = pattern_nfa_design.accept_states.map { 
			|accept_state| FARule.new(accept_state, nil, pattern_nfa_design.start_state)  
		} +	[FARule.new(start_state, nil, pattern_nfa_design.start_state)]
		rulebook = NFARulebook.new(rules + extra_rules)

		NFADesign.new(start_state, accept_states, rulebook)
	end
end
