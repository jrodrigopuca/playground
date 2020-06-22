def math(array)
  primer_item= array.shift
  while(array.length > 0) do
    siguiente_item= array.shift
    primer_item= yield primer_item, siguiente_item
  end 
  return primer_item
end

p math([4,5,6]){|a,b| a+b} #15
p math([4,5,6]){|a,b| a*b} #120
p math([4,5,6]){|a,b| a-b} #-7