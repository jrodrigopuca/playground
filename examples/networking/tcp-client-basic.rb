# Objetivo: mostrar un cliente TCP básico en Ruby.
# Cómo funciona: se conecta a un servidor TCP y muestra en consola todas las líneas recibidas.
# Resultado esperado: imprime la respuesta del servidor y luego cierra la conexión.
# Dependencias: stdlib (socket).
# Estado: estable
# Fecha de modificación: 2026-03-23

require 'socket'

hostname = '127.0.0.3'
port = 8080

client = TCPSocket.open(hostname, port)
while (line = client.gets)
  puts line.chop
end
client.close
