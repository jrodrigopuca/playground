# Estructuras de control

# IF_ELSE_END
edad=18
esMayor = if edad >= 18 
        :mayor 
else
    :menor 
end

puts esMayor                    #=> mayor
puts edad if edad>=18           #=> 18      Inline IF

# Ternario  sentencia?true:false
puts edad<18?(:menor):(:mayor) #=> mayor


puts '---'

# CASE-WHEN-END
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