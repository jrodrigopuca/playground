# Método singleton
#   Un método que pertenece sólo a un objeto 
#   se conoce como método singleton

class ClaseSin
    def saludar 
        puts "hola"
    end 
end 

testA= ClaseSin.new
testB= ClaseSin.new 

def testB.saludar
    puts "otro saludo"
end 

testA.saludar   #=> hola
testB.saludar   #=> otro saludo
puts "---"


# Objeto procedimiento{}
#   para definir respuestas a sucesos inesperados

op = proc{puts "Haz algo!"}
#op.call

def probarAlgo(objProc)
    puts "iniciar"
    objProc.call()
    puts "finalizado"
end 

probarAlgo(op) #=>  iniciar haz algo finalizado

