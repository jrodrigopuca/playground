# Objetivo: calcular estadísticas básicas sobre un array numérico.
# Cómo funciona: calcula suma, promedio y mediana a partir de una colección ordenable.
# Resultado esperado: imprime una tupla con suma, promedio y mediana.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

def calculate_median(array)
  array = array.sort
  if array.length.odd?
    array[array.length / 2]
  else
    (array[array.length / 2] + array[(array.length / 2) - 1]) / 2.to_f
  end
end

def stats(array)
  sum = array.reduce(:+)
  average = sum / array.length
  median = calculate_median(array)
  return sum, average, median
end

p stats([3, 1, 2])
