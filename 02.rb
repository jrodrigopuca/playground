# booleans
b = true
puts b.instance_of? TrueClass #=> true (es instancia) 
puts '---'

# Condiciones
puts true == "true" #=> false   
puts true != b      #=> false
puts false & b      #=> false   and
puts false | b      #=> True    or
puts false || b     #=> true    logical or
puts false ^ b      #=> true    xor 
puts '---'

# Números
=begin
Numeric
	|-Integer
		|--Fixnum
		|--Bignum
	|-Float
=end
puts 0x100	        #base 16 =>256
puts 0d100	        #base 10=>100
puts 0100	        #base 8 =>64
puts 0o100	        #base 8 =>64
puts 0b100	        #base 2=> 4	
puts 100_001        #ruby elimina los _ para números
puts "123".to_i     #123
puts '---'

# array
arr= []
p arr                      #=> [] 
# creando nuevo array
p Array.new(3)             #=> [nil, nil, nil]
p Array.new(3, "b")        #=> ["b", "b", "b"]
p Array.new(2){"a"}        #=> ["a", "a"]
p Array.new(2){["a","b"]}  #=> [["a", "b"], ["a", "b"]]
p Array.new(3){|i| i}      #=> [0, 1, 2]
p Array.new(3){|i| i+=1}   #=> [1, 2, 3]
puts '---'

# operaciones entre vectores
p [1,2]+[3,4]				#=> [1, 2, 3, 4] 	agregar a vector
p [1,2,3] - [2]				#=> [1,3]			quitar elemento repetido
p [1,2,3] | [3,4]			#=> [1,2,3,4]		agregar solo elementos no repetidos

a=[1,2]
b=[3,4]
p a.each_index{|i| a[i]+=b[i]} #=> [4,6] suma entre vectores
puts '---'

# descomposición
numeros = [1,2,3]
a, *b = numeros
p b			#=> [2,3]

puts '---'


# acceso a elementos del array 
c=[1,2, 3, 4, 5, 6, "siete", 0]
p c.sample				#elemento random
p c.first 				#primero
p c.last  				#ultimo
p c.count 				#numero de elementos
p c.join    			#=> "123456siete0" unión

p c.map{|v| v*2}		#=> [2, 4, 6, 8, 10, 12, "sietesiete",0]

p c.any?{|v| v>3}		#=> true (busca algún valor)
p c.keep_if{|v| v.is_a?(Integer)} #=>[1,2,3,4,5,6,0] solo mantiene los integer
p c.sort				#=> [0, 1, 2, 3, 4, 5, 6]
puts '---'

p [1,nil,3].compact 			#=> elimina los nulos [1,3] 
p [1,2,3].permutation(2).to_a	#=> crea nuevos arrays permutando los valores [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]
p [1,2,3].combination(2).to_a 	#=> crea nuevos arrays combinando los valores [[1, 2], [1, 3], [2, 3]]
puts '---'

# rangos
p (2..5)					#2..5
p (2..5).to_a				#[2, 3, 4, 5]
p (1..5).map{|v| v>3?100:0} #[0, 0, 0, 100, 100]
puts '---'

# Conversiones (casting)
p "1.50".to_f 				# 1.5
p 1.50.to_s 				# "1.5"
p "1.50".to_i				# 1 
p "algo".to_sym 			#=> :algo 	convierte un string a un simbolo

# Tipado dinámico
x= [:a, :b, :c]
p x.map(&:to_s) # => ['a', 'b', 'c']