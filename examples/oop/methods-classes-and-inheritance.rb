# Objetivo: mostrar métodos, clases, herencia y sobrecarga básica en Ruby.
# Cómo funciona: define métodos con distintos tipos de argumentos, crea clases, usa herencia y redefine operadores.
# Resultado esperado: imprime ejemplos de métodos, clases, herencia y operadores personalizados en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

puts '---Métodos---'

def sum(a, b = 0)
  "la suma es #{a + b}"
end

puts sum(1, 2)

puts '=======ARGUMENTO========='
puts '---Método con argumento posicional ---'

def calculate_tax(value, tax)
  puts (value * tax).to_f
end

calculate_tax(10, 0.25)

puts '---Método con parantesis opcional ---'

def greet(name)
  puts "Hola #{name}"
end

greet 'Juan'

puts '---Método con argumento obligatorio/opcional ---'

def log(message, time = Time.now)
  puts "[#{time}] #{message}"
end

log 'Usuario Logeado'

puts '---Método con argumentos no posicionales---'

def notify(options = {})
  person = options[:usuario]
  message = options[:texto]
  p "-#{person}: #{message}"
end

notify(texto: 'Hola, ¿cómo estás?', usuario: 'Juan')

puts '---Métodos luego de Ruby 2.0 ---'

def log_new(message:, time: Time.now)
  puts "[#{time}] #{message}"
end

log_new(message: 'Usuario Logeado')

puts '---Método con Splat: cualquier argumento---'

def many_parameters(*parameters)
  puts "valores: #{parameters.join(', ')}"
end

many_parameters('uno', 'dos')

puts '---Método con doble Splat: cualquier argumento y no posicional---'

def notify_v2(**options)
  person = options[:usuario]
  message = options[:texto]
  p "-#{person}: #{message}"
end

notify_v2(texto: 'Hola, ¿cómo estás?', usuario: 'Juan')

puts '=======RETORNO========='
puts '---Método con retorno---'

def subtract(value1, value2)
  value1 - value2
end

p subtract(10, 1)

puts '---Método con múltiples retornos---'

def operations(a, b)
  results = []
  results << a + b
  results << a - b
  results << a * b
end

puts operations(1, 2)

def return_randoms(value)
  return rand(value), rand(value)
end

p return_randoms(5)

array = [1, 2, 3, 4, 5]
last_1, last_2 = array.last(2)
p [last_1, last_2]

puts '---Método con retorno de boolean ---'

def adult?(age)
  age > 18
end

puts adult?(28)

puts '---Método con modificación del objeto o bang! ---'

def unique!(test)
  test.uniq!
end

test_array = [1, 2, 3, 4, 3, 2, 1]
unique!(test_array)
p test_array

$global_variable = 50
_local_variable = 100

class Person
  attr_accessor :name
  attr_reader :age
  attr_writer :birth_date

  @@current_year = 2019
  WATER_TARGET = 80

  def initialize(name)
    @name = name
  end

  def add_age(birth_year)
    @age = @@current_year - birth_year
  end

  def name=(name)
    @name = name
  end

  def greet
    "hola #{name}"
  end

  def adult?
    @age > 18
  end
end

person = Person.new('Juan')
puts person.instance_of?(Person)
puts person.name
puts person.add_age(1900)
puts person.age
puts(person.name = 'Pepe')
puts person.adult?
puts person.greet
puts Person::WATER_TARGET
puts '---'

class ParentInheritance
  def show_text
    'hola'
  end
end

class ChildInheritance < ParentInheritance
  def show_text
    super + ' estoy usando herencia'
  end

  def public_method
    'público vs ' + self.private_method
  end

  def private_method
    'privado'
  end

  protected :private_method
end

puts ChildInheritance.ancestors
puts '---'

heir = ChildInheritance.new
puts heir.show_text
puts heir.public_method
puts '---'

class OpenClass
  DEFAULT_MESSAGE = 'Hola mundo'

  def greet
    'Hola'
  end

  def return_greeting(message = nil)
    message.nil? ? DEFAULT_MESSAGE : 'Gracias'
  end

  def -@
    'negativo'
  end

  def [](a, b)
    a + b
  end

  def []=(a, b, c, d)
    puts(a + b + c) * d
  end

  def a=(value)
    puts "asignado: #{value}"
  end

  def ==(value)
    "comparado con #{value}"
  end

  def +(value)
    value
    'Intenando sumar'
  end

  def **(value)
    value
    'Intentando usar potencia'
  end
end

puts OpenClass.new.greet
object = OpenClass.new

puts(-object)
puts object[1, 2]
object[1, 2, 3] = 4
object.a = 5
puts object == 3
puts object + 5
puts object**2
puts OpenClass::DEFAULT_MESSAGE
puts object.return_greeting('¿cómo estás?')
puts '---'

class DefaultValue
  def to_s
    'valor por defecto'
  end
end

puts DefaultValue.new
puts '---'

puts __FILE__
puts __dir__
puts $$
