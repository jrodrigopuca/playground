# Ruby con interfaz grafica

# tutorial en https://aula301.com/aplicaciones-de-escritorio-gui-con-ruby/

require 'gtk2'

class RubyApp < Gtk::Window

def initialize
super                                                  #Llama al método inicializador de la clase padre

inicializar_ventana                                     #Método donde tenemos todo el código de nuestra aplicación
end

def inicializar_ventana

set_title "Mi primera ventana"                          #Nombre de la ventana
set_default_size 500, 500                               #Tamaño de la ventana
set_window_position Gtk::Window::Position::CENTER       #Posición de la ventana
boton = Gtk::Button.new "Mi primer botón"               #Crear botón

add(boton)                                              #Añadir botón a la ventana

show_all                                                #Mostrar todos los elementos generados
end
end

Gtk.init
window = RubyApp.new
Gtk.main