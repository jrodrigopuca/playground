# Objetivo: mostrar métodos singleton y uso básico de proc en Ruby.
# Cómo funciona: redefine un método para una instancia concreta y ejecuta un proc dentro de otro método.
# Resultado esperado: imprime ejemplos de singleton methods y procedimientos en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Método singleton
class SingletonClassExample
  def greet
    puts 'hola'
  end
end

test_a = SingletonClassExample.new
test_b = SingletonClassExample.new

def test_b.greet
  puts 'otro saludo'
end

test_a.greet
test_b.greet
puts '---'

# Objeto procedimiento{}
operation = proc { puts 'Haz algo!' }

def test_something(operation_proc)
  puts 'iniciar'
  operation_proc.call
  puts 'finalizado'
end

test_something(operation)
