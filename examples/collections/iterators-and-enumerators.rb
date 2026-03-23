# Objetivo: mostrar iteradores y enumeradores básicos en Ruby.
# Cómo funciona: usa each, each_with_index y map sobre arrays y hashes.
# Resultado esperado: imprime distintos ejemplos de iteración y transformación de colecciones.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Iteradores y Enumeradores

# EACH
puts '=========EACH =============='
p [1, 2, 3].each.class

[1, 2, 3].each { |item| puts "Item con each (forma simple) #{item}" }

[1, 2, 3].each do |item|
  puts "Item con each (usando do) #{item}"
end

person = { id: 3, nombre: 'Juan', puntos: 10 }
person.each do |key, value|
  puts "#{key} tiene como valor a #{value}"
end

puts '=========EACH CON INDEX =============='
people = ['Bob', 'Dylan', 'Charles', 'Alex']
people.each_with_index do |person_name, index|
  puts "Bienvenido #{person_name} a la posición #{index}"
  if index < people.length - 1
    puts "el siguiente es #{people[index + 1]}"
  else
    puts "#{person_name} es el último en ingresar"
  end
end

person = { id: 3, nombre: 'Juan', puntos: 10 }
person.each_with_index do |(key, value), index|
  puts "#{key} tiene como valor a #{value} en posición #{index}"
end

puts '=========MAP =============='
p [1, 2, 3].map { |item| item + 5 }
p ['a', 'b'].map(&:upcase)

def calculate_price(array, &block)
  array.map do |item|
    block.call(item.to_f)
  end
end

prices = [1, 2, 5, 10]
tax = 0.21

new_price = calculate_price(prices) do |price|
  puts "a $#{price} le corresponde $#{price + price * tax}"
end

p new_price
