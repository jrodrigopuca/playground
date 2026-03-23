# Objetivo: mostrar tipos básicos, booleanos, truthy/falsey y símbolos en Ruby.
# Cómo funciona: imprime clases, operadores booleanos y ejemplos de veracidad y símbolos.
# Resultado esperado: muestra en consola ejemplos de tipos y comportamiento básico del lenguaje.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# asignación
hello = 123
hello = 'hola'

# tipo de dato
# notar que . es igual a ::

# String
p hello.class
p hello::class

# Numericos
# Enteros
p 10::class
p 223498172012::class
# Flotantes
p 2.1::class
# Complejos
p (2 + 1i)::class
# Racionales
p (2 / 3r)::class

# Booleanos
p false::class
p true::class

p '*** Métodos en Enteros ***'
p 2.next
p 2.pred
p 2.lcm(8)
p 2.gcd(8)

p '*** Métodos en Flotantes ***'
p 2.56::ceil
p 2.56::floor
p 4.7::next_float
p 4.7::prev_float
p 4.7::round

p '*** Métodos con booleanos ***'
a = nil
p a.nil?
b = true
puts b.instance_of?(TrueClass)

# Operadores booleanos
b = true
puts '--- operadores booleanos ---'
puts !b
puts true == 'true'
puts true != b
puts false & b
puts false | b
puts false || b
puts false ^ b

# Veracidad
puts '--- Veracidad ---'

def truthy_status(value)
  if value
    'truthy'
  else
    'falsey'
  end
end

p truthy_status(0)
p truthy_status('')
p truthy_status('hola')
p truthy_status(nil)
p truthy_status(1.2)
p truthy_status(true)
p truthy_status(false)
p truthy_status([1, 2])
p truthy_status({ clave: 'valor' })

# Symbol
puts '--- Symbol ---'
p 'string_test'.object_id
p 'string_test'.object_id
puts :test.object_id
puts :test.object_id
