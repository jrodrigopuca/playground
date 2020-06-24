# Metódos
# p 2.methods              #=> todos los métodos de un entero
# p "hola"::public_methods #=> métodos públicos de un string
# Un método es compuesto por: 
#   signature: primera linea del método 
#       - como el método es llamado (clase, instancia, módulo, anonimamente) 
#       - nombre del método
#       - argumentos
#   implementación: cuerpo del método


puts '---Métodos---'
# Método con valor por defecto y return 
def suma a,b=0
    "la suma es #{a+b}"
end
puts suma(1,2)              #=> la suma es 3

puts "=======ARGUMENTO========="
puts '---Método con argumento posicional ---'
def calcular_impuesto(valor, impuesto)
    puts (valor*impuesto).to_f
end
calcular_impuesto(10,0.25) #=> 2.5

puts '---Método con parantesis opcional ---'
def saludar nombre
    puts "Hola #{nombre}" 
end 
saludar "Juan" #=> "Hola Juan"

puts '---Método con argumento obligatorio/opcional ---'
def log(mensaje,tiempo=Time.now) 
    puts "[#{tiempo}] #{mensaje}"
end 
log "Usuario Logeado" #=> [2020-06-23 22:34:14 -0300] Usuario Logeado


puts '---Método con argumentos no posicionales---'
# Es una forma introducida en Ruby 2 para usar argumentos en cualquier posición. Tambien llamados Keywords arguments
def notificar(opciones={})
    persona = opciones[:usuario]
    mensaje = opciones[:texto]
    p "-#{persona}: #{mensaje}"
end
notificar(texto:"Hola, ¿cómo estás?", usuario:"Juan") #=> "-Juan: Hola, ¿cómo estás?"


puts '---Métodos luego de Ruby 2.0 ---'
# se puede pasar los valores de forma más explicita
def log_nuevo(mensaje:,tiempo:Time.now) 
    puts "[#{tiempo}] #{mensaje}"
end 
log_nuevo(mensaje:"Usuario Logeado") #=> [2020-06-23 22:57:35 -0300] Usuario Logeado


puts '---Método con cualquier parametro---'
def nParameters(*par)
    puts "valores: #{par.join(", ")}"
end 
nParameters("uno", "dos")   #=> valores: uno, dos


puts "=======RETORNO========="

puts '---Método con retorno---'
def resta(var1, var2)
    var1-var2
end 
p resta(10,1) #=> 9

puts '---Método con múltiples retornos---'
# para tener múltiples retornos se crea un array y se agrega (<<) al array los valores
def operaciones a, b
    resultados = []
    resultados << a+b 
    resultados << a-b
    resultados << a*b
end 
puts operaciones 1, 2       #=> 3 -1  2

def retornar_aleatorios valor
    return rand(valor), rand(valor)
end 
p retornar_aleatorios(5)    #=> [2, 4]

array = [1,2,3,4,5]
ultimo1, ultimo2 = array.last(2)
p [ultimo1, ultimo2]        #=> [4,5]

puts '---Método con retorno de boolean ---'
def es_mayor?edad
    edad>18
end 
puts es_mayor?28            #=> true

puts '---Método con modificación del objeto o bang! ---'
def unico! test 
    test.uniq!
end 
test_array = [1,2,3,4,3,2,1]
unico!(test_array) 
p test_array        #=> [1, 2, 3, 4]


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
        "público vs "+ self.metodo_privado 
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
puts heredero.mostrarTexto      #=> hola estoy usando herencia
puts heredero.metodo_publico    #=> público vs privado
puts "---"

# El objetivo ahora es usar metodos y redifinir operadores

class ClaseAbierta
    MENSAJE_DEF= "Hola mundo"
    def saludar 
        "Hola"
    end 

    def devolverSaludo(mensaje=nil)
        mensaje==nil ? MENSAJE_DEF : "Gracias"
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
        #en vez de sumar el valor muestra texto
        "Intenando sumar"
    end

    def **(val)
        #en vez de usar potencia muestra texto
        "Intentando usar potencia"
    end
end

puts ClaseAbierta.new.saludar 
obj = ClaseAbierta.new 

puts -obj     #=> negativo
puts obj[1,2] #=> 3
obj[1,2,3]=4  #=> 24
obj.a=5       #=> asignado:5
puts obj==3   #=> comparado con 3
puts obj+5    #=> Intentando sumar
puts obj**2    #=> Intentando usar potencia
puts ClaseAbierta::MENSAJE_DEF          #=> Hola mundo
puts obj.devolverSaludo("¿cómo estás?") #=> "Gracias"
puts "---"

# Devolver un valor por defecto
class Df 
    def to_s
        "valor por defecto"
    end
end

puts Df.new #=> "valor por defecto"
puts "---"


# Constantes especiales
puts __FILE__       #=> 04.rb
puts __dir__        #=> F:/playground
puts $$             #=> Número de proceso: 1172




