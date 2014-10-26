require './class_3'

p pattern = Concatenate.new(
		Literal.new('a'),
		Concatenate.new(Literal.new('b'),Literal.new('c'))
	)

p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('abc')