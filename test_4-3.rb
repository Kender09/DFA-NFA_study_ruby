require './class_3'

p pattern = Choose.new(Literal.new('a'),Literal.new('b'))

p pattern.matches?('a')
p pattern.matches?('b')
p pattern.matches?('c')