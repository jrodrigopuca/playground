# Objetivo: mostrar un servidor TCP básico en Ruby.
# Cómo funciona: crea un TCPServer, acepta conexiones y responde con un mensaje simple a cada cliente.
# Resultado esperado: mantiene el puerto abierto y responde a clientes entrantes.
# Dependencias: stdlib (socket).
# Estado: estable
# Fecha de modificación: 2026-03-23

require 'socket'

host = '127.0.0.3'
port = 8080

socket = TCPServer.new(host, port)

def handle_connection(client)
  puts "Nuevo cliente! #{client}"
  client.puts "Hola desde el server #{Time.now.ctime}"
  client.close
end

puts "Listening on #{port}. Press CTRL+C to cancel."

loop do
  client = socket.accept
  Thread.new { handle_connection(client) }
end
