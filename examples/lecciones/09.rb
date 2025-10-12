# lectura de archivo
File.open("otros/texto.txt") do |f|
    f.each do |linea|
        puts linea 
    end 
end