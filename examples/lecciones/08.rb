# Iteradores y Enumeradores
# son métodos para iterar sobre una colección de datos

# EACH
# este método es el más simple, devuelve un enumerador
puts "=========EACH =============="
p [1,2,3].each.class #=> Enumerator

# forma de iterar
[1,2,3].each{|i| puts "Item con each (forma simple) #{i}"}
# forma de iterar con más de una línea
[1,2,3].each do |i|
  puts "Item con each (usando do) #{i}"
end
# forma de iterar con hash
persona = {id:3, nombre:'Juan', puntos:10}
persona.each do |clave, valor|
  puts "#{clave} tiene como valor a #{valor}"
end 


puts "=========EACH CON INDEX =============="
# forma de iterar con array
personas= ["Bob", "Dylan", "Charles", "Alex"]
personas.each_with_index do  |persona, index|
  puts "Bienvenido #{persona} a la posición #{index}"
  if index < personas.length - 1
    puts "el siguiente es #{personas[index+1]}"
  else 
    puts "#{persona} es el último en ingresar"
  end 
end

# forma de iterar con hash
# Nota: es muy importante los parentesis en (clave, valor)
persona = {id:3, nombre:'Juan', puntos:10}
persona.each_with_index do |(clave, valor), index|
  puts "#{clave} tiene como valor a #{valor} en posición #{index}"
    # => id tiene como valor a 3 en posición 0
    # => nombre tiene como valor a Juan en posición 1
    # => puntos tiene como valor a 10 en posición 2
end 

puts "=========MAP =============="
# Map: devuelve una nueva colección de items
p [1,2,3].map{|i| i+5} #=> [6, 7, 8]

p ['a', 'b'].map(&:upcase) # Transformar cada item a mayus
#=> ["A","B"]

# Ejemplo
### Método para calcular el precio
def calcular_precio(array, &bloque)
  array.map do |item|
    bloque.call(item.to_f)
  end
end

precios = [1,2,5,10]
impuesto= 0.21
### 
nuevo_precio= calcular_precio precios do |precio|
  puts "a $#{precio} le corresponde $#{precio + precio*impuesto}"
end