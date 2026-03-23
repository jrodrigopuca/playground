# Objetivo: practicar un juego simple de adivinanza con entrada del usuario.
# Cómo funciona: genera un número aleatorio y pide intentos hasta acertar o agotar oportunidades.
# Resultado esperado: informa si el usuario acertó o cuál era el número correcto.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

# Dado un número aleatorio el usuario deberá adivinarlo

def guess(max_numbers, max_attempts)
  attempts = 0
  magic_number = rand(max_numbers)
  answer = nil

  while answer != magic_number
    print 'Incorrecto. ' unless answer.nil?
    puts 'Adivina el número, cúal es?'
    answer = gets.chomp.to_i
    attempts += 1
    break if attempts >= max_attempts
  end

  win = 'Correcto'
  lose = "No, el número era #{magic_number}. Vuelvas pronto"
  puts answer == magic_number ? win : lose
end

def guess_ref(max_numbers, max_attempts)
  attempts = 1
  magic_number = rand(max_numbers)
  answer = nil

  loop do
    puts 'Adivina el número, cúal es?'
    answer = gets.chomp.to_i
    break if attempts >= max_attempts
    break if answer == magic_number

    attempts += 1
    puts 'Incorrecto. '
  end

  puts answer == magic_number ? 'Correcto' : "No, el número era #{magic_number}. Vuelvas pronto"
end

guess_ref(5, 3)
