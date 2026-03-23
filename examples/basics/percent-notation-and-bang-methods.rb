# Objetivo: mostrar notación % y bang methods en Ruby.
# Cómo funciona: usa literales con notación %, expresiones regulares y métodos que modifican el objeto original.
# Resultado esperado: imprime ejemplos de notación % y de modificación in-place.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

p '*** Notación %  ***'
puts %q('Hola' mundo)
puts %i(/ - *)
pattern = %r(\d)
p pattern::match('2')

p '*** Método Bang !  ***'

text = 'hola'
text.capitalize
p text
text.capitalize!
p text
