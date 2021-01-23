require 'graphql'

# Definir tipos
TipoConsulta = GraphQL::ObjectType.define do
    name 'Consultar'

    field :nombre do
        type types.String
        resolve -> (obj, args, ctx) {'Juan'}
    end 
end 

#Definir Schema
Esquema = GraphQL::Schema.define do 
    query TipoConsulta
end 

# ejecutar consulta 
consulta = "{nombre}"
resultado=Esquema.execute(consulta).to_json
puts resultado

