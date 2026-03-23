# Objetivo: mostrar arrays, rangos y conversiones comunes en Ruby.
# Cómo funciona: crea arrays, recorre colecciones, aplica operaciones y muestra conversiones básicas.
# Resultado esperado: imprime ejemplos de manipulación de arrays, rangos y casting en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Números con base
puts '--- base ---'
puts 0x100
puts 0d100
puts 0o100
puts 0o100
puts 0b100
puts 100_001
puts '123'.to_i

# array
puts '--- array ---'
array = []
p array
p Array.new(3)
p Array.new(3, 'b')
p Array.new(2) { 'a' }
p Array.new(2) { ['a', 'b'] }
p Array.new(3) { |index| index }
p Array.new(3) { |index| index + 1 }

# Iteración
puts '-- Iterar array--'
array_numbers = [1, 2, 3, 4]
array_numbers.each do |element|
  puts element
end

# iteración con index
puts '-- Iterar con un index--'
array_numbers.each_with_index do |element, index|
  puts "#{index}: #{element}"
end

# descomposición
puts '--- descomposición ---'
numbers = [1, 2, 3]
first, *rest = numbers
p first
p rest

# operaciones entre vectores
puts '--- Operaciones ---'
p [1, 2] + [3, 4]
p [1, 2, 3] - [2]
p [1, 2, 3] | [3, 4]
p [1, 2, 3, 4].push(5)
p([1, 2] << 3)

a = [1, 2]
b = [3, 4]
p a.each_index { |index| a[index] += b[index] }

# Métodos de array
puts '--- Métodos de array ---'
c = [1, 2, 3, 4, 5, 6, 'siete', 0, 'x']
p c.sample
p c.length
p c.size
p c.first
p c.last
p c.pop
p c.count
p c.join
p c.respond_to?('first')
p c.include?(1)
p c.map { |value| value * 2 }
p c.any? { |value| value.is_a?(Integer) && value > 3 }
p c.keep_if { |value| value.is_a?(Integer) }
p c.sort
p c.sort.reverse
p [1, nil, 3].compact
p [1, 2, 3].permutation(2).to_a
p [1, 2, 3].combination(2).to_a
p [1, 2, 3, 3, 3].uniq
p [1, 2, 3].inspect

# rangos
puts '--- rangos ---'
p(2..5)
p (2..5).to_a
p (1..5).map { |value| value > 3 ? 100 : 0 }

# Conversiones (casting)
puts '--- conversiones ---'
p '1.50'.to_f
p 1.50.to_s
p '1.50'.to_i
p 'algo'.to_sym

# Tipado dinámico
x = [:a, :b, :c]
p x.map(&:to_s)
