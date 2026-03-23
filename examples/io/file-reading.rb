# Objetivo: mostrar lectura básica de archivos en Ruby.
# Cómo funciona: abre un archivo de texto y recorre sus líneas imprimiéndolas en consola.
# Resultado esperado: imprime el contenido del archivo configurado línea por línea.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

file_path = File.expand_path("../../data/texto.txt", __dir__)

File.open(file_path) do |file|
  file.each do |line|
    puts line
  end
end
