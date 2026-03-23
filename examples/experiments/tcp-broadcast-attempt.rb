# Objetivo: explorar un intento de servidor TCP con broadcast a múltiples clientes.
# Cómo funciona: acepta conexiones y trata de enviar mensajes a clientes conectados.
# Resultado esperado: ejemplo experimental para estudio; no está listo para uso confiable.
# Dependencias: stdlib (socket).
# Estado: experimental
# Fecha de modificación: 2026-03-23

require 'socket'

host = '127.0.0.3'
port = 8080

socket = TCPServer.new(host, port)

clients = []
puts "Acceso en puerto: #{port}. Para cancelar CTRL+C."

i = 0
loop {
  connection = socket.accept
  Thread.start(connection) do |con|
    clients[i] = con
    puts "conexión establecida #{con}"
    connection.puts 'bienvenido cliente'
    communicate(con)
  end
}.join

def communicate(connection)
  connection
  loop do
    clients.each do |client|
      client.puts 'hola!'
    end
  end
end
