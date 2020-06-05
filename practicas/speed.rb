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

def determiner

end 
