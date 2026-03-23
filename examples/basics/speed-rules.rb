# Objetivo: calcular velocidad sugerida según luz, clima y distancia.
# Cómo funciona: aplica reglas condicionales para determinar la velocidad adecuada en distintos escenarios.
# Resultado esperado: imprime velocidades calculadas o lanza error si el clima no está contemplado.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-23

def determine_speed(light, weather, distance, limit)
  raise 'no considerado' unless valid_weather?(weather)

  case light
  when :verde
    drive_green_light(weather, distance, limit)
  when :amarillo
    drive_yellow_light(weather, distance, limit)
  else
    drive_red_light(weather, distance, limit)
  end
end

def valid_weather?(weather)
  %i[soleado lluvioso].include?(weather.to_sym)
end

def drive_green_light(weather, distance, limit)
  if weather == :soleado
    limit
  elsif weather == :lluvioso
    distance >= 50 ? limit : limit * 0.9
  else
    raise 'no considerado'
  end
end

def drive_yellow_light(weather, distance, limit)
  if distance >= 50
    limit * 0.8
  else
    if weather == :soleado
      limit * 0.5
    elsif weather == :lluvioso
      limit * 0.25
    else
      raise 'no considerado'
    end
  end
end

def drive_red_light(weather, distance, limit)
  if distance < 50
    0
  else
    if weather == :soleado
      limit * 0.5
    elsif weather == :lluvioso
      limit * 0.25
    else
      raise 'no considerado'
    end
  end
end

p determine_speed(:amarillo, :soleado, 25, 35)
p determine_speed(:rojo, :lluvioso, 25, 35)
p determine_speed(:verde, :lluvioso, 25, 35)
p determine_speed(:verde, :soleado, 25, 35)
p determine_speed(:verde, :nublado, 50, 100)
