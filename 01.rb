# comentario 

# multiples lineas
=begin
    comentario1
    comentario2
    comentario3
=end 


# imprimir contenido
puts "Buen inicio"      #=> Buen inicio
p "Buen inicio"         #=> "Buen inicio"

# imprimir variables
texto = "hola "
puts texto
puts "#{texto} !!!"    #=> hola !!! (interpolación)
puts texto.concat("Juan") #=> hola Juan (concatenar)
puts "-----"

# métodos de string
puts texto.upcase      #=> HOLA  (a mayúsculas)
puts texto.object_id   #=> 24763344 (traer ID)
puts texto.strip       #=> hola (quitar espacios)
puts texto.chr         #=> h (caracter)
puts texto.length      #=> 5 (longitud)
puts texto[3]          #=> a (como array)
puts texto.include?"ol"#=> true (busca subcadena)
puts texto.index("o")  #=> 1 (busca indice)
puts texto.crypt("sal") #=> aplica criptografia
puts texto.hash()      #=> hash
puts texto.capitalize #=> "Hola" (con la primera letra en mayus)
puts "h o l a".split #=> h o l a (separado por nueva lineas)
puts "-----"

# bloque de string 
mensaje = <<EOS 
uno
dos
tres
EOS
puts mensaje 
puts "-----"

# string con secuencia de escape
puts "texto \n nueva linea"
puts "texto \t tab"
puts "texto \"comillas\" "
puts "texto \\ barra invertida"
puts "-----"





