# Objetivo: simular tiradas de dados en Ruby.
# Cómo funciona: recibe cantidad de lados y cantidad de tiradas, y devuelve un array con los resultados.
# Resultado esperado: imprime las tiradas generadas para los dados solicitados.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Dice Roller (dados)

def roll(number_of_sides = 6, number_of_rolls = 1)
  Array.new(number_of_rolls) { rand(number_of_sides) + 1 }
end

p roll(6, 5)
