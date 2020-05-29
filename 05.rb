# scope 
nombre = "Juan"
def nombre.saludar 
    "Hola "+ self
end 
puts nombre.saludar #=> Hola Juan

# redefinir función
class String
    def to_i 
        "sobrescribiendo!"
    end 
end
puts "3".to_i       #=> sobreescribiendo!

# parametros
def suma(uno, dos)
    uno+dos
end 
p suma(2,3)         #=> 5

#  parametros opcionales (operador splat)
def muchos_args(*args)
    p args
end 
muchos_args 1, 2, "hola" #=> [1, 2, "hola"]

# parametros con valores por defectos
def nombrar(nombre="valor por default")
    p nombre
end 
nombrar             #=> valor de default

def nombrar(nombre, otracosa)
    p nombre+otracosa
end
nombrar "hola ", "polimorfismo"
puts "---"

# Usando Yield (permite pasar una sentencia para ser usada dentro del método)
def usandoY(arg)
    puts "#{arg} antes del yield"
    yield
    puts "#{arg} despues del yield"
end 

usandoY('test!'){puts "YIELD"}
puts "---"

# Usando función como bloque
p [0,1,2,3,4].map{|i| i*3}  #=> [0, 3, 6, 9, 12]
puts "---"

# Reflection: utilizado para entender lo que se sucede en tiempo de ejecución
class MiClase
  def saludar
    p "hola"
  end
end

# sin reflection
obj1= MiClase.new
obj1.saludar

# con reflection
class_name = "MiClase"
method_name= :saludar
obj2 = Object.const_get(class_name).new
obj2.send method_name
puts "---"

# metaprogramación: permite crear métodos y clases dinamicamente en tiempo de ejecución.
['uno','dos','tres'].each do |num|
  define_method(num) do
    num.upcase
  end
end

puts dos





