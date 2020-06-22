# Dado un número aleatorio el usuario deberá adivinarlo

def adivina(max_numeros, max_intentos)
  intentos = 0
  numero_magico=rand(max_numeros)
  respuesta= nil 
  while respuesta!=numero_magico do
    print "Incorrecto. " unless respuesta.nil? #no hace esto si es nil
    puts "Adivina el número, cúal es?"
    respuesta= gets.chomp.to_i
    intentos+=1
    break if intentos>=max_intentos
  end 
    gana= "Correcto"
    pierde="No, el número era #{numero_magico}. Vuelvas pronto"
    puts respuesta==numero_magico ? gana : pierde
end

# Lo mismo pero con refactoring
def adivina_ref(max_numeros, max_intentos)
  intentos = 1
  numero_magico=rand(max_numeros)
  respuesta= nil 
  loop do 
    puts "Adivina el número, cúal es?"
    respuesta= gets.chomp.to_i
    break if intentos>=max_intentos
    break if respuesta==numero_magico
    intentos +=1
    puts "Incorrecto. "
  end
  puts respuesta==numero_magico ? "Correcto" : "No, el número era #{numero_magico}. Vuelvas pronto"
end

# adivina(5,3)
adivina_ref(5,3)