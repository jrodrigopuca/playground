# Hashes
# son colecciones que guardan datos como pares clave-valor

puts "--- Hash ------"
hash1={}                # Simple hash
hash1=Hash.new          # simple hash con new
hash1= Hash.new("hola") # crea un hash con un valor por defecto
puts hash1[:loquesea]   #=> hola    acceder a un valor por defecto, se puede usar cualquier key

# Acceder a hash
puts "--- Acceder a hash ------"
perrito = {"nombre"=>"bobby", "tipo"=>"perro"}
perros = {:bobby=>12, :blanco=>3, :apolo=>5}

# agregar/ver elementos 
perrito["edad"]=2               # key string
perrito[:casa]=true             # key symbol
p perrito                       #=> {"nombre"=>"bobby", "tipo"=>"perro", "edad"=>2, :casa=>true}
p perrito["nombre"]             #=> "bobby"
p perrito[:casa]                #=> true


puts "--- Recorrer hash  ------"
# recorriendo hash
perrito.each do |clave, valor|
    puts "#{clave}: #{valor}"
end

puts "--- Operaciones con hash  ------"

p perrito.invert                # devuelve las claves como valor
p perrito.length                # longitud del hash
p perrito.to_a                  # convierte en array
p perros.sort_by{|nombre, edad| edad}     #=> ordena por edad
p perros.merge(perrito)         # unir dos hashes
p perrito.keys                  # claves
p perrito.values                # valores
p perrito.delete(:casa)         # borra clave-valor
p perros.reject{|nombre, edad| edad>6}  #remover o filtrar los valores que no cumplen con la condición
p perros.has_value?(3)          # tiene el valor?

puts "--- Ejemplo con Hash  ------"
hora = "00:05:23.323"
hora_hash={}
hora_hash["hh"]= hora.split(":")[0]
hora_hash["mm"]= hora.split(":")[1]
hora_hash["ss"]= hora.split(":")[2].split(".")[0]
hora_hash["s"]= hora.split(":")[2].split(".")[1]
p hora_hash


puts "--- Generar contenido para hash  ------"
# Generando contenido para el hash
# Hash.new{|hash,key| block} -> new_hash
hash2 = Hash.new{|hash,key| hash[key]="Hola #{key}"}
puts hash2[:Juan]       #=> Hola Juan

hash3 = Hash.new{|hash,key| key*key}
puts hash3[9]           #=> 81

hash4 = Hash.new do |h,k|
    h[k]=k.to_s.length
end

puts hash4["hola a todos"]      #=> 12
