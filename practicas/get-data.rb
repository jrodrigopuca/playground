def hacer_get(url, headers={}, *params)
    head=headers.length > 0 ? "Headers: #{headers}" : "Sin headers"
    puts "Conectando con #{url} - #{head}"
    params.each do |param|
        puts "parámetro: #{param}"
    end
end

def conectar(con_headers=false,con_fecha=false, con_datos=true)
    headers= {accept: "application/json"}
    url = "https://github.com"
    args= [url] 
    args << headers if con_headers
    params = [] 
    params << "fecha=#{Time.now}" if con_fecha
    params << "datos=true" if con_datos 
    args << params if params.length > 0
end

hacer_get(*conectar)
hacer_get(*conectar(true))
hacer_get(*conectar(false, true, false))
