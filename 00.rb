# asignación
hola = 123
hola = "hola"

# tipo de dato
# notar que . es igual a :: 

# String
  p hola.class  #=> String
  p hola::class # => String

# Numericos
  # Enteros
    p 10::class           #=> Fixnum
    p 223498172012::class #=> Bignum
  # Flotantes
    p 2.1::class          #=> Float
  # Complejos
    p (2+1i)::class       #=> Complex
  # Racionales
    p (2/3r)::class       #=> Rational
  # BigDecimal
  # https://ruby-doc.org/stdlib-2.5.1/libdoc/bigdecimal/rdoc/BigDecimal.html

# Booleanos
  p false::class          #=> FalseClass
  p true::class           #=> TrueClass

p "*** Métodos en Enteros ***"
p 2.next    #=> 3 Siguiente
p 2.pred    #=> 1 Anterior
p 2.lcm(8)  #=> 8 minimo común múltiplo
p 2.gcd(8)  #=> 2 máximo común divisor 

p "*** Métodos en Flotantes ***"
p 2.56::ceil      #=> 3  el más cercano siguiente entero
p 2.56::floor     #=> 2  el más cercano previo entero
p 4.7::next_float #=> 4.700000000000001
p 4.7::prev_float #=> 4.699999999999999
p 4.7::round      #=> 5 redondea

# Métodos 
# p 2.methods              #=> todos los métodos de un entero
# p "hola"::public_methods #=> métodos públicos de un string
