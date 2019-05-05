# Hashes
meses= Hash.new("mes") # crea un hash con contenido "mes"
puts meses[2]   #=> mes
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
menu={"sectionA":"header","sectionB":"main"} 
p menu                  #=> {:section1=>"header", :section2=>"main"}
puts menu[:sectionB]    #=> main
