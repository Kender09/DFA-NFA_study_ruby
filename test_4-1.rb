require './class_3'

p nfa_design = Empty.new.to_nfa_design
p nfa_design.accepts?('')
p nfa_design.accepts?('a')

p nfa_design = Literal.new('a').to_nfa_design
p nfa_design.accepts?('')
p nfa_design.accepts?('a')
p nfa_design.accepts?('b')

p Empty.new.matches?('a')
p Literal.new('a').matches?('a')