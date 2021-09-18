# if 
variable = 10
mensaje= 
	if variable ==10
		"igual"
	else
		"no igual"
	end 

puts mensaje

#if-then
hacer = true
mensaje = if hacer then "hacer algo" else "nop" end
puts mensaje


# if con ternario
mensaje = variable ==3 ? "igual":"no igual" 
puts mensaje			# => "no igual"


# unless es un if contrario
hacer = true
mensaje= 
	unless hacer  
		"hacer algo"
	else 
		"nop"
	end
puts mensaje

# unless dentro de una misma linea
mensaje2 = "uno"					# "uno"
mensaje2 = "dos" unless false		# "dos" si es verdadero
puts mensaje2						# => "dos"

# condición ||=
mensaje3 =false
mensaje3 ||= "nuevo"	# mensaje3 || mensaje3 = "nuevo"
puts mensaje3			# => "nuevo"

# case 
mensaje= case variable
	when 1
		"uno"
	when 2
		"dos"
	when 10 then "diez"		#condición en misma linea
	else 
		"ninguno"
	end
puts mensaje 

# case usando múltiples condiciones 
mensaje = case 
		when variable != 10
			"diferente"
		when variable == 10
			"igual"
		end 
puts mensaje

# while (forma acortada) 
while (variable <15) do puts variable; variable+=1; end

# while (forma completa)
while variable<20
	puts variable
	variable+=1
end

# until 
until variable>22 do puts variable; variable+=1; end  

# begin/end con while
begin 
	puts variable; 
	variable+=1;
end while variable<25

# begin/end con until
begin 
	puts variable; 
	variable+=1;
end until variable>27

# for usando array 
a = [1, 3, 5]
for i in a
	puts i 
end

#for 
for i in (1..10)
	puts i 
end 

# iteración y bloques
a.each do 
	puts "iteración"
end 

=begin 
para obtener todos los objetos
https://stackoverflow.com/questions/14318079/how-do-i-list-all-objects-created-from-a-class-in-ruby

#Recorriendo objetos
todos_obj = Clase.all
todos_obj.each{ |objeto| puts objeto.name}

=end

# usando loop para recorrer
loop do 
	print "ingresa tecla 'r':"
	line = gets
	break if (line == "r\n")	# salida del loop
	p line
end
puts "gracias"

# loop con numeros
10.upto(12){|i| puts i} 
12.downto(10){|i| puts i}
3.times{puts "hello"}
1.step(5,2){|i| puts i} #inicio.step(max, sumando)

# loop con next/break/redo

encontrado=false
it= 0
while !encontrado
	ran1 = rand(10)
	ran2 = rand(10)
	it+=1
	puts "número1: #{ran1},número2: #{ran2}, iteración: #{it}"
	break if it==30		#salida

	next if ran1!=ran2 	#siguiente la iteración
	puts "hay concidencia"
	#redo if ran1==ran2		#repite iteración
	encontrado=true
end

# Exceptions

def mod_a 
	hacer_algo_1
	hacer_algo_2
	hacer_algo_3
end

begin
	mod_a()
rescue => e 								#se puede tener más de un rescue
	puts "El error: "+e.message 			#personalizando error
	puts "Lugares: "+ e.backtrace.to_s 	#lugar
	#raise SystemCallError, "un error ha ocurrido"	#atrapando error 
else 
	puts "todo bien!"
end


#r3
