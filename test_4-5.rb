require './class_3'

p pattern = 
	Repeat.new(
		Concatenate.new(
			Literal.new('a'),
			Choose.new(Empty.new, Literal.new('b'))
		)
	)

p pattern.matches?('')
p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('aba')
p pattern.matches?('abab')
p pattern.matches?('abaab')
p pattern.matches?('abba')