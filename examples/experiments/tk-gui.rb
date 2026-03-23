# Objetivo: mostrar una GUI mínima con Tk en Ruby.
# Cómo funciona: crea una ventana simple con un label y un botón de salida.
# Resultado esperado: abre una ventana y permite cerrarla desde el botón.
# Dependencias: tk (dependencia especial del sistema).
# Estado: experimental
# Fecha de modificación: 2026-03-23

require 'tk'

root = TkRoot.new { title 'Hola' }

def say_hello
  puts 'Terminar correctamente'
  exit
end

TkLabel.new(root) do
  text 'Label'
  pack { padx 35; pady 35; side 'left' }
end

TkButton.new(root) do
  text 'Salir'
  pack { padx 55; pady 55; side 'left' }
  command(proc { say_hello })
end

Tk.mainloop
