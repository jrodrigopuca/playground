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


p "*** Métodos con booleanos ***"
a = nil 
p a.nil?          #=> true 
b = true
puts b.instance_of? TrueClass #=> true (es instancia) 

# Operadores booleanos
b = true
puts '--- operadores booleanos ---'
puts !b 						#=>
puts true == "true" #=> false   
puts true != b      #=> false
puts false & b      #=> false   and
puts false | b      #=> True    or
puts false || b     #=> true    logical or
puts false ^ b      #=> true    xor 

# Veracidad
# similar a los booleanos existen otros valores que pueden
# dar verdadero o falso en una comparación
puts '--- Veracidad ---'
def is_truthy(val)
  if val 
    "truthy"
  else 
    "falsey";
  end
end
p is_truthy(0)                #truthy
p is_truthy("")               #truthy
p is_truthy("hola")           #truthy
p is_truthy(nil)              #falsey
p is_truthy(1.2)              #truthy
p is_truthy(true)             #truthy
p is_truthy(false)            #falsey
p is_truthy([1,2])            #truthy
p is_truthy({clave:"valor"})  #truthy

# Orden de precedencia
=begin
()[]=               (referencia, conjuntos)
**                  (potencia)
!~+-                negado, complemento, "unary plus/minus"
*/%                 múltiplicación, división y módulo
+-                  suma, resta
>> <<               desplazamiento a la derecha/izquierda
&                   'AND' bit-a-bit 
^ |                 'XOR' 'OR' bit-a-bit
<=< >>=             Operadores de comparación
<=> == === != =~ !~ Operadores de igualdad o patrón
&&                  AND lógico
||                  OR lógico
..  ...             Rango (inclusivo y exclusivo)
?:                  Ternario
= %= { /= _= += |= &= >>= <<= *= &&= ||== **= asignación

=end


# Symbol
## Es un objeto básico en Ruby, es solo un nombre y un ID. 
## Es útil porque un simbolo se refiere a un mismo objeto 
## y es más eficiente que un string
puts '--- Symbol ---'
p "string_test".object_id #=> 23799024
p "string_test".object_id #=> 23798952
puts :test.object_id      #=> 212756
puts :test.object_id      #=> 212756