# Dice Roller (dados)
=begin
  Objetivos:
  - Tira un dado
  - Tira un dado con cualquier número de lados
  - Tira cualquier cantidad de dados

=end


def tirar num_lados=6, num_veces=1
  tiradas = Array.new(num_veces){|i| i=rand(num_lados)+1}
end

p tirar 6,5 # tirar 5 veces un dado de 6 lados