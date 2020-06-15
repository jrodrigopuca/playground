# Estructuras de control

# if-then
puts "====== IF-THEN ======"
hacer = true
mensaje = if hacer then "hacer algo" else "no hacer nada" end 
puts mensaje #=> "hacer algo"

# IF_ELSE_END
puts "====== IF-ELSE-END ======"
edad=18
esMayor = if edad >= 18 
            :mayor 
        else
            :menor 
        end

puts esMayor                    #=> mayor
puts edad if edad>=18           #=> 18      Inline IF

# ELSIF
puts "====== ELSIF ======"
def hora_hacer_algo(hora)
    if hora > 8 && hora <18
        "trabajar"
    elsif hora > 18
        "relax"
    else 
        "descansar"
    end
end
puts "hora de #{hora_hacer_algo(3)}"

# UNLESS (es como IF pero con false)
puts "====== UNLESS ======"
lloviendo=false
unless lloviendo #sino esta lloviendo
    puts "no esta lloviendo"
else 
    puts "esta lloviendo"
end


# Ternario  sentencia?true:false
puts "====== TERNARIO ======"
puts edad<18?(:menor):(:mayor) #=> mayor


# CASE-WHEN-END
puts "====== CASE/WHEN ======"
# por valor
def tipo_animal(tipo)
    case tipo
    when :perro then "woof"
    when :gato  then "meow"
    else nil
    end
end
p tipo_animal(:perro)


# por rango
valor = 5
case valor
when 1..5
    puts "del 1 a 5"
when 6..10
    puts "del 5 al 10"
else 
    puts "otro valor"
end # => "del 1 a 5"

# por tipo de dato
valor2 = "hola"
case valor2
when Integer
    puts "número entero"
when String
    puts "texto"
else
    puts "otra cosa"
end #=> "texto"

# WHILE_UNTIL
i= 0 
while i<5 
    puts "i: #{i}"
    i+=1
end 

#loops