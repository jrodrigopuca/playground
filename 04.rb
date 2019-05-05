
# varible global
$variableglobal=50
_localvariable=100

# Definir clase
class Persona
    # @
    attr_accessor :nombre #permite read-write
    attr_reader :edad
    attr_writer :fnac
    
    # variable de clase
    @@anio_actual=2019
    CANT_AGUA= 80 #constante

    # constructor
    def initialize(nombre)
        @nombre=nombre 
    end 

    def agregarEdad(fnacimiento)
        @edad=@@anio_actual-fnacimiento
    end 

    def nombre=(nombre)
        @nombre=nombre
    end

    def saludar
        "hola #{nombre}"
    end 

    def mayor? 
        @edad>18
    end

end 

persona = Persona.new("Juan")
puts persona.instance_of? Persona   #=>true
puts persona.nombre                 #=>Juan
puts persona.agregarEdad(1900)      #=>119
puts persona.edad                   #=>119
puts persona.nombre = "Pepe"        #=>Pepe
puts persona.mayor?                 #=>true Llamando a función con retorno booleano
puts persona.saludar                #=>hola Pepe 
puts Persona::CANT_AGUA             #=>80 Llamando a constante
puts "---"

# Herencia

class HerenciaP 
    def mostrarTexto
        "hola"
    end 
end 

class HerenciaH < HerenciaP 
    def mostrarTexto
        super + " estoy usando herencia"
    end 

    # Método público
    def metodo_publico 
        "publico vs "+ self.metodo_privado 
    end 

    # Método privado
    def metodo_privado 
        "privado"
    end

    # proteger el método privado
    protected :metodo_privado
end 


puts HerenciaH.ancestors    #muestra las clases superiores 
puts "---"

heredero= HerenciaH.new()
puts heredero.mostrarTexto
puts heredero.metodo_publico
puts "---"

class ClaseAbierta
    def saludar 
        "Hola"
    end 

    def -@
        "negativo"
    end 

    # A[a,b]
    def [](a,b)
        a+b
    end
    
    # A[a,b,c]=d
    def []=(a,b,c,d)
        puts (a+b+c)*d # cuando se asigne algo muestra esto
    end

    # A.a=val
    def a=(val)
        puts "asignado: #{val}"
    end

    # A == val
    def == (val)
        "comparado con #{val}"
    end 

    def + (val)
        "sumar"
    end
end

puts ClaseAbierta.new.saludar 
obj = ClaseAbierta.new 

puts -obj     #=> negativo
puts obj[1,2] #=> 3
obj[1,2,3]=4  #=> 24
obj.a=5       #=> asignado:5
puts obj==3   #=> comparado con 3
puts obj+5    #=> sumar
