## Determinar la velocidad
=begin
  - basado en condiciones ambientales
  - estado del trafico
  - distancia al semaforo

luz verde:
  - soleado,  todas las condiciones = speed_limit
  - lluvioso, distancia >= 50       = speed_limit
  - lluvioso, distancia < 50        = speed_limit 90%

luz amarrilla
  - soleado, distancia >= 50        = speed_limit 80%
  - soleado, distancia < 50         = speed_limit 50%
  - lluvioso, distancia >= 50       = speed_limit 80%
  - lluvioso, distancia < 50        = speed_limit 25%
  
luz roja
  - soleado, distancia >= 50        = speed_limit 50%
  - soleado, distancia < 50         = speed_limit 0%
  - lluvioso, distancia >= 50       = speed_limit 25%
  - lluvioso, distancia < 50        = speed_limit 0% 

=end

def determinar(luz, clima, distancia, limite)

  raise "no considerado" unless clima_valido?(clima)

  case luz 
  when :verde
    conducir_luz_verde(clima, distancia, limite)
  when :amarillo
    conducir_luz_amarillo(clima, distancia, limite)
  else # :rojo
    conducir_luz_rojo(clima, distancia, limite)
  end 
end

def clima_valido?(clima)
  [:soleado,:lluvioso].include?(clima.to_sym)
end

def conducir_luz_verde(clima, distancia, limite)
  if clima == :soleado
    limite
  elsif clima == :lluvioso
    if distancia >= 50
      limite
    else
      limite * 0.9
    end
  else 
    raise "no considerado"
  end 
end 

def conducir_luz_amarillo(clima, distancia, limite)
  if (distancia >=50)
    limite * 0.8
  else
    if (clima == :soleado)
      limite * 0.5
    elsif (clima == :lluvioso)
      limite * 0.25
    else 
      raise "no considerado"
    end
  end 
end

def conducir_luz_rojo(clima, distancia, limite)
  if (distancia < 50)
    0
  else
    if (clima == :soleado)
      limite * 0.5 
    elsif (clima == :lluvioso)
      limite * 0.25
    else 
      raise "no considerado"
    end
  end
end

p determinar(:amarillo, :soleado, 25, 35) #=> 17.5
p determinar(:rojo, :lluvioso, 25, 35)    #=> 0
p determinar(:verde, :lluvioso, 25, 35)   #=> 31.5
p determinar(:verde, :soleado, 25, 35)    #=> 35
p determinar(:verde, :nublado,50,100)     #=> no considerado (RuntimeError)