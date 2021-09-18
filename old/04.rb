#booleans
variable = false
puts true.instance_of? TrueClass	#=> true
puts true & variable				#=> false
puts false == "false" 			#=> false
puts true ^ variable 				#=> true	XOR
puts true | variable 				#=>true OR
puts true || variable  			#=>true Logical OR

#Más info: http://devdocs.io/ruby~2.4/trueclass

#Números
=begin
Numeric
	|-Integer
		|--Fixnum
		|--Bignum
	|-Float
=end
puts 0x100	#base 16 =>256
puts 0d100	#base 10=>100
puts 0100	#base 8 =>64
puts 0o100	#base 8 =>64
puts 0b100	#base 2=> 4	
puts 100_001 #ruby elimina los _ para números


#strings
puts 'hola'
puts 'hola\\'	#=>hola\
mensaje = <<EOS 
hola jhjhkjh
EOS
puts mensaje

puts "texto \n nueva linea"
puts "texto \t tab"
puts "texto \" comillas \""

#r3-04
puts "\100" #=> @
puts "hola".upcase!
puts "hola"[2]						#=>"o"
puts "hola".chr					#caracter
puts "hola".concat("jhkhkj")		#concatenación
puts "hola".include? "ol"			#busca texto dentro del string 
puts "hola".index("ol")			#busca indice de lo anterior
puts "hola".insert(2,"ol")		#inserta texto en una posición
puts "hola".length					#longitud

puts "h o l a".split
puts "-----"
#regular expressions
#Documentación: http://devdocs.io/ruby~2.4/regexp
#Para probar regexp: rebular.com
puts /\d+/ =~ "ñ2333d323"			#probar  
puts /\d+/.match("hola123")		#=>123
m = /(?<month>\d{1,2})\/(?<day>\d{1,2})\/(?<year>\d{4})/.match('Hoy es 1/15/2018')
puts m 					#Parte que coincide
puts m.pre_match		#Parte anterior
puts m["month"]		#=>	1
puts m["day"]			#=>	15
puts m["year"]			#=>	2018

puts "---"
p "Hora 03:30".scan(/\d+/)		#["03", "30"]

# Usando gsub para remplazar
# http://devdocs.io/ruby~2.4/string#method-i-gsub
puts "hello".gsub(/[aeiou]/, '*')   #=> h*ll*


s= "password: 1234"
puts s.gsub(/(password: )(\w+)/){|match| "#{$1}"+"*"* $2.length}

# symbol
# http://rubylearning.com/satishtalim/ruby_symbols.html

puts "string".object_id  #=> 41781972
puts "string".object_id  #=>	41786340
puts :symbol.object_id  	#=> 472916
puts :symbol.object_id 	#=> 472916

p :abc.to_s 				#=>"abc"
p "abc".to_sym 			#=>:abc

# array
arr1 = []
p arr1 						#=>[]

arr1 = Array.new(3)
p arr1						#=>[nil, nil, nil]

arr1 = Array.new(3, "abc") 
p arr1						#=> ["abc", "abc", "abc"]

arr1 = Array.new(3){["a", "b"]} 
p arr1						#=> [["a", "b"], ["a", "b"], ["a", "b"]]

arr1 = [1, 2] + [3,4]		#=> [1, 2, 3, 4]
p arr1

arr1 [2..3] = [:v1, :v2] 	
p arr1						#=> [1, 2, :v1, :v2]


# Array usando notación %
arr1=%w[uno dos]		#array de string
p arr1			#=>["uno", "dos"]
arr1=%i[nombre edad] 	#array de symbols
p arr1			#=> [:nombre, :edad]
arr1=%q[nombre edad] 	#string
p arr1			#=> "nombre edad"
arr1=%x[ls] 			#comandos shell
p arr1			#=> "01.rb\n02.rb\n03.rb\n04.rb\n"
arr1=%r[\d+]			#=> expresión r
p arr1			#=> /\d+/
#r3-08
#arrays hashes





#http://ruby-doc.com/docs/ProgrammingRuby/html/web.html