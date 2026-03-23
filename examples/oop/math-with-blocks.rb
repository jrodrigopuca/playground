# Objetivo: mostrar uso de yield para aplicar operaciones acumulativas.
# Cómo funciona: recorre un array y aplica un bloque sobre el acumulador y el siguiente elemento.
# Resultado esperado: imprime distintos resultados según el bloque usado.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

def math(array)
  first_item = array.shift
  while array.length > 0
    next_item = array.shift
    first_item = yield first_item, next_item
  end
  first_item
end

p math([4, 5, 6]) { |a, b| a + b }
p math([4, 5, 6]) { |a, b| a * b }
p math([4, 5, 6]) { |a, b| a - b }
