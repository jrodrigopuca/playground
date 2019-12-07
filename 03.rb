# Hashes

hash1= Hash.new("hola") # crea un hash con contenido "mes"
puts hash1[:loquesea]   #=> hola
puts "--"

# hash con contenido
perrito = {"nombre"=>"bobby", "tipo"=>"perro"}
p perrito
puts perrito["nombre"]          #=> bobby
puts perrito["nombre"].inspect  #=>"bobby" devuelve como string
p perrito.invert                #=> {"bobby"=>"nombre", "perro"=>"tipo"} devuelve las claves como valor
puts perrito.length             #=> 2
p perrito.to_a                  #=> [["nombre", "bobby"], ["tipo", "perro"]] convierte a array
puts "--"

# recorriendo hash
perrito.each do |clave, valor|
    puts "#{clave}: #{valor}"
end

puts "--"

# Acceder al contenido del hash
puntos={"City":12,"United":14} 
puntos[:Real]= 10       #=> si uso puntos["real"] no lo tomara como key
p puntos                #=> {:City=>12, :United=>14,:Real=>10}
puts puntos[:United]    #=> 14

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
