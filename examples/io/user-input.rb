# Objetivo: mostrar entrada básica de usuario con gets.
# Cómo funciona: solicita un número, lo lee desde stdin y lo convierte a entero.
# Resultado esperado: imprime el número ingresado convertido a entero.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

p "ingresa un número:"
number = gets.chomp
p "el numero ingresado fue #{number.to_i}"

# obtener todas las carpetas
# Dir.entries("./")
