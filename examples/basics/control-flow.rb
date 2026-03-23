# Objetivo: mostrar estructuras de control y loops básicos en Ruby.
# Cómo funciona: usa if, unless, case, while, until y loop con ejemplos concretos.
# Resultado esperado: imprime distintos flujos de control en consola.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# if-then
puts '====== IF-THEN ======'
do_it = true
message = if do_it then 'hacer algo' else 'no hacer nada' end
puts message

# IF_ELSE_END
puts '====== IF-ELSE-END ======'
age = 18
is_adult = if age >= 18
             :mayor
           else
             :menor
           end

puts is_adult
puts age if age >= 18

# ELSIF
puts '====== ELSIF ======'
def task_by_hour(hour)
  if hour > 8 && hour < 18
    'trabajar'
  elsif hour > 18
    'relax'
  else
    'descansar'
  end
end

puts "hora de #{task_by_hour(3)}"

# UNLESS
puts '====== UNLESS ======'
raining = false
unless raining
  puts 'no esta lloviendo'
else
  puts 'esta lloviendo'
end

# Ternario
puts '====== TERNARIO ======'
puts age < 18 ? :menor : :mayor

# CASE-WHEN-END
puts '====== CASE/WHEN ======'
def animal_sound(type)
  case type
  when :perro then 'woof'
  when :gato then 'meow'
  else nil
  end
end

p animal_sound(:perro)

value = 5
case value
when 1..5
  puts 'del 1 a 5'
when 6..10
  puts 'del 5 al 10'
else
  puts 'otro valor'
end

value2 = 'hola'
case value2
when Integer
  puts 'número entero'
when String
  puts 'texto'
when Hash
  puts 'hash'
else
  puts 'otra cosa'
end

puts '====== LOOPS ======'
i = 0
while i < 5
  puts "i con while-do: #{i}"
  i += 1
end

i = 0
i += 1 while i < 5
puts "i con while en una sentencia: #{i}"

b = 0
until b >= 300
  b += 50
  puts "b con until-do: #{b}"
end

b = 0
loop do
  b += 50
  puts "b con do-while: #{b}"
  break if b >= 300
end

b = 0
begin
  b += 50
  puts "b con do-while en begin-end: #{b}"
end while b < 300
