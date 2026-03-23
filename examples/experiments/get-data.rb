# Objetivo: mostrar splat y armado dinámico de argumentos para una llamada tipo GET.
# Cómo funciona: construye una lista variable de argumentos y luego los expande al llamar una función.
# Resultado esperado: imprime la URL, headers y parámetros según la configuración elegida.
# Dependencias: stdlib.
# Estado: experimental
# Fecha de modificación: 2026-03-23

def do_get(url, headers = {}, *params)
  header_message = headers.length > 0 ? "Headers: #{headers}" : 'Sin headers'
  puts "Conectando con #{url} - #{header_message}"
  params.each do |param|
    puts "parámetro: #{param}"
  end
end

def connect(with_headers = false, with_date = false, with_data = true)
  headers = { accept: 'application/json' }
  url = 'https://github.com'
  args = [url]
  args << headers if with_headers
  params = []
  params << "fecha=#{Time.now}" if with_date
  params << 'datos=true' if with_data
  args << params if params.length > 0
end

do_get(*connect)
do_get(*connect(true))
do_get(*connect(false, true, false))
