# Cliente
require 'socket'

hostname = '127.0.0.3'
port = 8080

cliente= TCPSocket.open(hostname, port)

mensaje= gets.chomp 
cliente.puts mensaje 

loop{
    begin
        Thread.new do 
            loop do 
                respuesta= cliente.gets.chomp
                puts respuesta
            end 
        end

    end 
}.join



cliente.close


=begin
while line = client.gets     
   puts line.chop      
end
client.close
=end