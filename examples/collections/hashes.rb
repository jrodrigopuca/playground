# Objetivo: mostrar operaciones básicas y comunes con hashes en Ruby.
# Cómo funciona: crea hashes, agrega y elimina claves, recorre pares clave-valor y genera valores por defecto.
# Resultado esperado: imprime ejemplos de uso y transformación de hashes en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Hashes
# son colecciones que guardan datos como pares clave-valor

puts '--- Hash ------'
hash = {}
hash = Hash.new
hash = Hash.new('hola')
puts hash[:loquesea]

# Acceder a hash
puts '--- Acceder a hash ------'
dog = { 'nombre' => 'bobby', 'tipo' => 'perro' }
dogs = { bobby: 12, blanco: 3, apolo: 5 }

# agregar/ver elementos
dog['edad'] = 2
dog[:casa] = true
p dog
p dog['nombre']
p dog[:casa]

puts '--- Recorrer hash  ------'
dog.each do |key, value|
  puts "#{key}: #{value}"
end

puts '--- Operaciones con hash  ------'
p dog.invert
p dog.length
p dog.to_a
p dogs.sort_by { |_name, age| age }
p dogs.merge(dog)
p dog.keys
p dog.values
p dog.delete(:casa)
p dogs.reject { |_name, age| age > 6 }
p dogs.has_value?(3)

puts '--- Ejemplo con Hash  ------'
time = '00:05:23.323'
time_hash = {}
time_hash['hh'] = time.split(':')[0]
time_hash['mm'] = time.split(':')[1]
time_hash['ss'] = time.split(':')[2].split('.')[0]
time_hash['s'] = time.split(':')[2].split('.')[1]
p time_hash

puts '--- Generar contenido para hash  ------'
hash2 = Hash.new { |generated_hash, key| generated_hash[key] = "Hola #{key}" }
puts hash2[:Juan]

hash3 = Hash.new { |_generated_hash, key| key * key }
puts hash3[9]

hash4 = Hash.new do |generated_hash, key|
  generated_hash[key] = key.to_s.length
end

puts hash4['hola a todos']
