require './class_3'

p pattern = Repeat.new(Literal.new('a'))

p pattern.matches?('')
p pattern.matches?('a')
p pattern.matches?('aaaa')
p pattern.matches?('b')