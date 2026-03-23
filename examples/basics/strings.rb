# Objetivo: mostrar operaciones básicas y comunes con strings en Ruby.
# Cómo funciona: crea strings, aplica métodos de transformación, búsqueda, reemplazo e interpolación.
# Resultado esperado: imprime distintos ejemplos de manipulación de strings en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# comentario

# multiples lineas
=begin
    comentario1
    comentario2
    comentario3
=end

# imprimir contenido
puts 'Buen inicio'
puts 'Buen inicio'

# imprimir variables
text = 'hola '
puts text
puts '-----'

# métodos de string
puts text.encoding
puts text.upcase
puts text.downcase
puts text.object_id
puts text.strip
puts text.chr
puts text.length
puts text[3]
puts text.include?('ol')
puts text.index('o')
puts text.crypt('sal')
puts text.hash
puts text.capitalize
puts 'mundo'.prepend('hola ')
p 'h o l a'.split
p 'h;o;l;a'.split(';')
puts 'h o l a'.strip
puts text.partition(' ')
puts text.equal?('b')

puts text[0, 2]
text['a'] = 'aa'
p text
text.gsub!('a', '!')
p text

puts '-----'

# bloque de string
message = <<EOS
uno
dos
tres
EOS
puts message
puts '-----'

# string con secuencia de escape
puts "texto \n nueva linea"
puts "texto \t tab"
puts "texto \"comillas\" "
puts "texto \\ barra invertida"
puts '-----'

# concatenación
puts 'hola ' + 'Juan'
puts 'hola '.concat('Juan')
puts 'hola ' << 'Juan'

# interpolación
hello = 'hola'
puts "#{hello} !!!"
puts "el resultado es #{2 + 3}"
