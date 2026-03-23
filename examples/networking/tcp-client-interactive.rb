# Objetivo: mostrar un cliente TCP interactivo en Ruby.
# Cómo funciona: se conecta al servidor, envía un mensaje desde stdin y luego escucha respuestas en un loop.
# Resultado esperado: envía un mensaje y muestra las respuestas recibidas del servidor.
# Dependencias: stdlib (socket).
# Estado: experimental
# Fecha de modificación: 2026-03-23

require 'socket'

hostname = '127.0.0.3'
port = 8080

client = TCPSocket.open(hostname, port)

message = gets.chomp
client.puts message

loop do
  begin
    Thread.new do
      loop do
        response = client.gets.chomp
        puts response
      end
    end
  end
end.join

client.close
