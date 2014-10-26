require './class_3'

require 'treetop'

Treetop.load('pattern')
p parse_tree = PatternParser.new.parse('(a(|b))*')

p pattern = parse_tree.to_ast

p pattern.matches?('')
p pattern.matches?('a')
p pattern.matches?('ab')
p pattern.matches?('aba')
p pattern.matches?('abab')
p pattern.matches?('abaab')
p pattern.matches?('abba')