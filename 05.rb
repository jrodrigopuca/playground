# scope 
nombre = "Juan"
def nombre.saludar 
    "Hola "+ self
end 
puts nombre.saludar #=> Hola Juan

# sobre-escribir función
class String
    def to_i 
        "sobrescribiendo!"
    end 
end
puts "3".to_i       #=> sobreescribiendo!

# argumentos
def suma(uno, dos)
    uno+dos
end 
p suma(2,3)         #=> 5

# múltiples argumentos
def muchos_args(*args)
    p args
end 
muchos_args 1, 2, "hola" #=> [1, 2, "hola"]

# argumentos con valores por defectos
def nombrar(nombre="valor por default")
    p nombre
end 
nombrar             #=> valor de default

def nombrar(nombre, otracosa)
    p nombre+otracosa
end
nombrar "hola ", "polimorfismo"


