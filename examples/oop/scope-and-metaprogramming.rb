# Objetivo: mostrar scope, redefinición, reflection y metaprogramación en Ruby.
# Cómo funciona: redefine métodos, usa yield, reflection y define métodos dinámicamente.
# Resultado esperado: imprime ejemplos de scope y metaprogramación en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# scope
name = 'Juan'

def name.greet
  'Hola ' + self
end

puts name.greet

# redefinir función
class String
  def to_i
    'sobrescribiendo!'
  end
end

puts '3'.to_i

# parametros
def sum(one, two)
  one + two
end

p sum(2, 3)

# parametros opcionales
def many_args(*args)
  p args
end

many_args 1, 2, 'hola'

# parametros con valores por defecto
def name_value(name = 'valor por default')
  p name
end

name_value

def name_value_pair(name, other_thing)
  p name + other_thing
end

name_value_pair 'hola ', 'polimorfismo'
puts '---'

# yield
def using_yield(arg)
  puts "#{arg} antes del yield"
  yield
  puts "#{arg} despues del yield"
end

using_yield('test!') { puts 'YIELD' }
puts '---'

# bloque
p [0, 1, 2, 3, 4].map { |index| index * 3 }
puts '---'

# Reflection
class MyClass
  def greet
    p 'hola'
  end
end

obj1 = MyClass.new
obj1.greet

class_name = 'MyClass'
method_name = :greet
obj2 = Object.const_get(class_name).new
obj2.send(method_name)
puts '---'

# metaprogramación
['uno', 'dos', 'tres'].each do |number|
  define_method(number) do
    number.upcase
  end
end

puts dos
