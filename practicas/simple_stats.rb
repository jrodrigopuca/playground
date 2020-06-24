# inject : https://apidock.com/ruby/Enumerable/inject

def calcular_mediana(array)
  array= array.sort
  if array.length.odd?
    array[array.length/2]
  else 
    (array[array.length/2] + array[array.length/2 - 1])/2.to_f 
  end
end


def stats(array)
  suma=array.reduce(:+) # array.inject(0){|total, i| total + i }   
  promedio = suma/array.length
  mediana= calcular_mediana(array)
  return suma, promedio, mediana
end 

p stats([3,1,2]) #=> [6, 2, 2]