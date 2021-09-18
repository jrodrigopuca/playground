# Server
require 'socket'

host= '127.0.0.3'
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

