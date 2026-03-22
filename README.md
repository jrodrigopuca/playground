## Playground

- 00.rb
  - Asignación
  - Tipos de datos
    - String
    - Númericos
    - Booleanos
  - Métodos
    - en enteros
    - en flotantes
    - en booleanos
  - Operadores booleanos
  - Veracidad
  - Orden de precedencia
  - Symbols
- 01.rb
  - Comentario
  - Imprimir texto
  - métodos de string
  - Bloques de string
  - string con secuencia de escape
  - concatenación
  - interpolación
- 02.rb
  - números con base
  - array
  - iteración
  - iteración con index
  - descomposición
  - operaciones entre vectores
  - métodos de array
  - rangos
  - conversiones (casting)
  - tipado dinámico
- 03.rb
  - hashes
  - acceder a hash
  - agregar/ver elementos
  - recorrer hash
  - operaciones con hash
  - ejemplocon hash
  - generar contenido para hash
- 04.rb
  - métodos
  - método con cualquier parametro
  - método con múltiples retornos
  - método con retorno de boolean
  - mótodo con modificación del objeto o bang!
  - variable global
  - clases
  - herencia
  - constantes especiales
- 05.rb
  - scope
  - redefinir función
  - parametros
  - parametros opcionales
  - parametros con valores por defecto
  - yield
- 06.rb
  - Singleton
- 07.rb
  - if/else
  - ternario
  - case-when
  - while-until
- 09.rb
  - lectura de archivo
- 10.rb
  - simple GUI
- 11.rb
  - entrada
- 12.rb
  - notación %
  - bang !

## Ejecutar con Docker Compose

Requisitos: tener Docker Desktop instalado y en ejecución.

Comandos rápidos:

```bash
# Abrir una sesión interactiva de Ruby (IRB)
docker compose run --rm ruby irb

# Ejecutar un script en la raíz del proyecto
docker compose run --rm ruby ruby 00.rb

# Ejecutar un script dentro de una subcarpeta
docker compose run --rm ruby ruby practicas/mind-reader.rb

# Pasar argumentos a tu script
docker compose run --rm ruby ruby 02.rb arg1 arg2
```

Notas:

- El contenedor monta este directorio en `/app`, por eso las rutas son relativas al root del repo.
- `tty` y `stdin_open` están habilitados, así que `gets` y otros métodos interactivos funcionan bien.
- Las gems se cachean en un volumen llamado `bundle` para acelerar instalaciones posteriores.
- Si necesitas gems, crea un `Gemfile` y luego:

```bash
docker compose run --rm ruby bundle install
```
