# Server comunicar
require 'socket'

host= '127.0.0.3'
port = 8080

socket = TCPServer.new(host, port)

clientes=[]
puts "Acceso en puerto: #{port}. Para cancelar CTRL+C."

i=0
loop{
    conexion = socket.accept
    Thread.start(conexion) do |con|
        clientes[i]=con
        puts "conexión establecida #{con}"
        conexion.puts "bienvenido cliente"
        comunicar(con)
    end
}.join


def comunicar(conexion)
    loop do 
        clientes.each do |c|
            c.puts "hola!"
        end
    end
end

=begin
        puts conexiones[:cliente]
        (@conexiones[:clientes]).keys.each do |cli|
            @conexiones[:clientes][cli].puts mensaje 
        end
=end