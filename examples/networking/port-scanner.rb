# Objetivo: escanear puertos abiertos en un host usando TCP connect scan.
# Cómo funciona: intenta establecer una conexión TCP a cada puerto del rango dado.
#   Si la conexión se establece, el puerto está abierto. Si se rechaza o hay timeout, está cerrado.
# Resultado esperado: lista todos los puertos abiertos encontrados en el host indicado.
# Dependencias: stdlib (socket), lib/pretty_console.
# Estado: estable
# Fecha de modificación: 2026-03-23
#
# Uso:
#   ruby port-scanner.rb [host] [puerto_inicio] [puerto_fin] [timeout]
#
# Argumentos (todos opcionales):
#   host           — dirección IP o hostname a escanear (default: 127.0.0.1)
#   puerto_inicio  — primer puerto del rango a escanear (default: 1)
#   puerto_fin     — último puerto del rango a escanear (default: 1024)
#   timeout        — segundos de espera por puerto en segundos (default: 1)
#
# Ejemplos:
#   ruby port-scanner.rb                              # localhost, puertos 1-1024
#   ruby port-scanner.rb 192.168.1.1                  # host custom, puertos 1-1024
#   ruby port-scanner.rb 127.0.0.1 4000 9000          # rango custom
#   ruby port-scanner.rb 127.0.0.1 1 65535 0.3        # todos los puertos, timeout rápido

require 'socket'
require_relative '../../lib/pretty_console'

include PrettyConsole

host = ARGV[0] || '127.0.0.1'
range_start = (ARGV[1] || 1).to_i
range_end = (ARGV[2] || 1024).to_i
timeout = (ARGV[3] || 1).to_f
total_ports = range_end - range_start + 1

banner('Port Scanner', subtitle: "TCP connect scan #{SYMBOLS[:arrow]} #{host}:#{range_start}-#{range_end}")

info "Timeout por puerto: #{timeout}s"
separator
puts

open_ports = []

(range_start..range_end).each_with_index do |port, index|
  progress_bar(index + 1, total_ports, label: "Escaneando")

  begin
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    remote_addr = Socket.sockaddr_in(port, host)

    # connect_nonblock evita quedarnos colgados en puertos filtrados
    socket.connect_nonblock(remote_addr)
    open_ports << port
  rescue Errno::EINPROGRESS
    # La conexión está en progreso, esperamos con IO.select
    if IO.select(nil, [socket], nil, timeout)
      begin
        socket.connect_nonblock(remote_addr)
        open_ports << port
      rescue Errno::EISCONN
        # Ya conectado — el puerto está abierto
        open_ports << port
      rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        # Cerrado o filtrado
      end
    end
  rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT, Errno::EHOSTUNREACH
    # Puerto cerrado, filtrado o host inalcanzable
  ensure
    socket&.close
  end
end

puts
separator

if open_ports.any?
  puts
  table(
    ['Puerto', 'Estado', 'Protocolo'],
    open_ports.map { |p| [p.to_s, colorize('ABIERTO', :bold, :green), 'TCP'] }
  )
end

summary(
  'Host'              => host,
  'Rango'             => "#{range_start}..#{range_end}",
  'Puertos escaneados' => total_ports.to_s,
  'Puertos abiertos'  => open_ports.size.to_s
)

if open_ports.any?
  success "#{open_ports.size} puerto(s) abierto(s): #{open_ports.join(', ')}"
else
  warning 'No se encontraron puertos abiertos en el rango especificado.'
end
