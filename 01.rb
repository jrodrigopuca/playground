# comentario 

# multiples lineas
=begin
    comentario1
    comentario2
    comentario3
=end 

# imprimir contenido
puts "Buen inicio"          #=> Buen inicio
puts "Buen inicio"          #=> "Buen inicio"

# imprimir variables
texto = "hola "
puts texto
puts "-----"

# métodos de string
puts texto.encoding         #=> UTF-8
puts texto.upcase           #=> HOLA     (a mayúsculas)
puts texto.downcase         #=> hola     (a minusculas)
puts texto.object_id        #=> 24763344 (traer ID)
puts texto.strip            #=> hola     (quitar espacios)
puts texto.chr              #=> h        (caracter)
puts texto.length           #=> 5        (longitud)
puts texto[3]               #=> a        (como array)
puts texto.include?("ol")   #=> true     (busca subcadena)
puts texto.index("o")       #=> 1        (busca indice)
puts texto.crypt("sal")     #=>          aplica criptografia
puts texto.hash()           #=> hash
puts texto.capitalize       #=> "Hola juan"             (con la primera letra en mayus)
puts "mundo".prepend("hola ")   #=> "hola mundo"        (agrega antes de la palabra)
p "h o l a".split               #=> ['h','o','l','a']   (divide el string en un array)
p "h;o;l;a".split(";")          #=> ['h','o','l','a']   (separa el string)
puts "h o l a".strip            #=> "hola"              (remueve espacios)
puts texto.partition(" ")       # separa en 3 partes    ("hola", " ", "juan") 
puts texto.equal?("b")          #=> false               (comparación)

puts texto[0,2]                 #=> ho       Substring
texto["a"]="aa"; p texto        #=> holaa    Remplazar (Replacing)
texto.gsub!("a","!");p texto    #=> hol!!    Remplaza a cada coincidencia



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

# concatenación (3 formas)
puts "hola " + "Juan"
puts "hola ".concat("Juan") 
puts "hola " << "Juan"

# interpolación
hola= "hola"
puts "#{hola} !!!"              #=> hola !!!
puts "el resultado es #{2+3}"   #=> el resultado es 5