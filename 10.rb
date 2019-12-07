# GUI con Ruby

require 'tk'

root = TkRoot.new{title "Hola"}    # crea ventana

def decirHola
    puts "Terminar correctamente"
    exit
end

# Crear label
TkLabel.new(root) do
    text 'Label'
    pack { padx 35 ; pady 35; side 'left' }
end

# Crear botón
TkButton.new(root) do
    text 'Salir'
    pack { padx 55 ; pady 55; side 'left' }
    command (proc{decirHola})
end

Tk.mainloop                 # inicia el bloque principal