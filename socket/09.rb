# Cliente
require 'socket'

hostname = '127.0.0.3'
port = 8080

client= TCPSocket.open(hostname, port)
while line = client.gets     
   puts line.chop      
end
client.close
