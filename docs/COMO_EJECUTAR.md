# Cómo ejecutar este playground

## Objetivo

Este documento explica cómo ejecutar los ejemplos del repositorio en su estado actual.

La idea es que puedas entrar al repo, elegir un ejemplo y correrlo sin adivinar rutas ni pelearte con el entorno.

## Formas disponibles hoy

Actualmente hay dos caminos reales de ejecución:

1. usar `bin/run`;
2. ejecutar manualmente con Docker Compose o Ruby local.

La forma recomendada hoy es **`bin/run`**.

---

## Opción recomendada: `bin/run`

### Qué hace

`bin/run` recibe:

- un modo de ejecución opcional;
- un grupo;
- un archivo sin extensión;
- argumentos opcionales.

Luego construye la ruta dentro de `examples/` y ejecuta el script.

### Sintaxis

```bash
bin/run --help
bin/run list
bin/run <ruta-al-archivo.rb> [args...]
bin/run <grupo> <archivo-sin-ext> [args...]
bin/run file <ruta-al-archivo.rb> [args...]
bin/run auto <grupo> <archivo-sin-ext> [args...]
bin/run auto file <ruta-al-archivo.rb> [args...]
bin/run local <grupo> <archivo-sin-ext> [args...]
bin/run local file <ruta-al-archivo.rb> [args...]
bin/run docker <grupo> <archivo-sin-ext> [args...]
bin/run docker file <ruta-al-archivo.rb> [args...]
```

### Modos disponibles

- `auto`: prioriza Docker si está realmente disponible; si no, usa Ruby local.
- `local`: fuerza ejecución con Ruby local.
- `docker`: fuerza ejecución con Docker Compose.

Si omitís el modo:

```bash
bin/run basics strings
```

el script lo interpreta como alias de:

```bash
bin/run auto basics strings
```

### Grupos válidos hoy

- `basics`
- `cli`
- `collections`
- `experiments`
- `io`
- `networking`
- `oop`

### Compatibilidad transitoria

El runner mantiene compatibilidad con grupos históricos como:

- `lecciones`
- `practicas`
- `socket`

### Ejecución directa por archivo

Ahora también podés ejecutar un ejemplo pasando la ruta del archivo directamente.

Ejemplos:

```bash
bin/run examples/basics/strings.rb
bin/run local file examples/cli/mind-reader.rb
bin/run docker file examples/networking/tcp-server-basic.rb
```

Esto viene bárbaro cuando agregás carpetas o archivos nuevos y no querés depender de mappings manuales.

### Ejemplos

```bash
bin/run --help
bin/run list
bin/run local basics strings
bin/run local cli mind-reader
bin/run local networking tcp-client-basic
bin/run lecciones 00
```

### Cómo decide si usa Docker o local

El comportamiento actual del script es este:

1. si el modo es `docker`, exige Docker Compose operativo;
2. si el modo es `local`, exige Ruby local disponible;
3. si el modo es `auto`, intenta Docker solo si:
   - existe el comando `docker`;
   - existe `docker compose`;
   - el daemon de Docker está realmente accesible;
4. si Docker no está operativo en modo `auto`, intenta ejecutar con Ruby local.

### Importante

Ahora `bin/run` ya permite elegir el modo explícitamente.

Eso baja bastante la magia del script y hace más predecible la ejecución.

También incorpora mejores mensajes de error cuando:

- el grupo no existe;
- el archivo no existe;
- Ruby local no está disponible;
- Docker Compose no está operativo.

### Descubrimiento de ejemplos

Para ver qué podés correr sin conocer la estructura de memoria:

```bash
bin/run list
```

Y para ver la ayuda completa:

```bash
bin/run --help
```

---

## Ejecución manual con Docker Compose

### Requisitos

- tener Docker instalado;
- tener Docker Compose disponible con `docker compose`.

### Qué ofrece el contenedor actual

El servicio `ruby` definido en `docker-compose.yml`:

- usa `ruby:4.0.2`;
- monta el repo en `/app`;
- mantiene `stdin_open` y `tty`, así que los scripts interactivos funcionan mejor;
- cachea gems en el volumen `bundle`.

### Comandos útiles

```bash
# Abrir IRB
docker compose run --rm ruby irb

# Ejecutar un ejemplo directamente
docker compose run --rm ruby ruby examples/basics/types-and-booleans.rb

# Ejecutar un script interactivo
docker compose run --rm ruby ruby examples/cli/mind-reader.rb

# Ejecutar un ejemplo de sockets
docker compose run --rm ruby ruby examples/networking/tcp-server-basic.rb
```

### Cuándo conviene usar Docker

Docker conviene cuando querés:

- evitar depender de tu instalación local de Ruby;
- tener un entorno más reproducible;
- ejecutar scripts interactivos con menos diferencias entre máquinas.

### Observación importante

El `docker-compose.yml` actual expone el puerto `3000:9292`, pero en el estado actual del repo no hay una app web activa que justifique ese mapeo como parte central del playground.

---

## Ejecución manual con Ruby local

### Requisitos

- tener Ruby instalado localmente;
- tener disponibles las gems necesarias si el ejemplo usa dependencias externas.

### Advertencia importante para macOS

Si estás en macOS, **no es buena idea apoyarte en el Ruby del sistema** como base del playground.

¿Y por qué? Porque normalmente:

- viene desactualizado;
- puede quedar demasiado acoplado al sistema operativo;
- instalar gems ahí puede ensuciar o complicar tu entorno local;
- te deja desalineado respecto al runtime objetivo del repo.

### Recomendación actual para entorno local

La dirección recomendada es esta:

1. preparar un runtime local moderno y aislado del sistema;
2. después ejecutar `bin/setup local`;
3. recién ahí usar `bin/run local ...`.

### Flujo local recomendado a futuro

```bash
bin/pre-setup-local
bin/setup local
bin/run local basics types-and-booleans
```

### Estado actual de esa recomendación

Hoy ese paso ya existe.

El flujo local recomendado queda así:

1. `bin/pre-setup-local check`
2. `bin/pre-setup-local install`
3. `bin/setup local`
4. `bin/run local <grupo> <archivo>`

### Qué hace `bin/pre-setup-local`

- verifica si estás usando Ruby del sistema;
- verifica si `mise` está disponible;
- usa `mise.toml` como fuente de verdad para la versión local de Ruby;
- prepara el runtime local antes del setup del proyecto.

### Ejemplos

```bash
ruby examples/basics/types-and-booleans.rb
ruby examples/cli/mind-reader.rb
ruby examples/networking/tcp-server-basic.rb
```

### Cuándo conviene usar local

Usar Ruby local conviene cuando querés:

- velocidad de ejecución inmediata;
- probar cosas simples sin levantar contenedores;
- iterar rápido en ejemplos chicos.

### Riesgo actual del modo local

Como el repo todavía no tiene un entorno unificado de dependencias en raíz, algunos ejemplos pueden requerir setup adicional en tu máquina.

Además, si el Ruby local es viejo o viene del sistema operativo, podés terminar con diferencias importantes respecto al entorno Docker del repo.

---

## Ejemplos interactivos

Algunos scripts esperan entrada del usuario usando `gets`.

Ejemplo:

```bash
bin/run cli mind-reader
```

O manualmente:

```bash
docker compose run --rm ruby ruby examples/cli/mind-reader.rb
```

Gracias a que el contenedor actual tiene `stdin_open` y `tty`, este tipo de scripts debería comportarse razonablemente bien dentro de Docker.

---

## Dependencias especiales

No todos los ejemplos usan solo la librería estándar.

### Casos detectados en el repo actual

- `examples/networking/*` usa `socket` de Ruby;
- `examples/experiments/tk-gui.rb` usa `tk`.

### Qué implica esto

- algunos ejemplos correrán sin problema en una instalación Ruby estándar;
- otros pueden requerir gems o soporte adicional del entorno.

En el estado actual del repo, esto ya no implica gems activas del playground en el `Gemfile` raíz.

### Estado actual del Gemfile raíz

Ahora el repo ya tiene un `Gemfile` raíz mínimo, pero por el momento no declara gems activas del playground.

### Qué sigue fuera del Gemfile

- `tk`

Ese caso sigue tratándose como dependencia especial del sistema y no como dependencia portable del playground.

---

## Problemas comunes

### 1. “No existe: examples/..."

Esto pasa cuando el grupo o el nombre del archivo no coinciden con un script real.

Ejemplo válido:

```bash
bin/run cli roller
```

No hace falta poner `.rb`, aunque el script tolera que lo pases.

### 2. Docker está instalado pero querías correr local

Ahora podés forzar modo local explícitamente:

```bash
bin/run local basics types-and-booleans
```

Si preferís hacerlo manualmente, también podés ejecutar el script con `ruby`.

### 3. Docker está instalado pero el daemon no está levantado

En modo `auto`, el script ahora detecta ese caso y cae a Ruby local si puede.

En modo `docker`, en cambio, falla explícitamente, que es lo correcto.

### 4. Falta una gem o dependencia del sistema

Esto puede pasar en ejemplos como `tk`.

En ese caso tenés dos caminos:

- preparar el entorno local con lo necesario;
- o correr dentro de Docker, si ese entorno resuelve mejor la dependencia.

---

## Evolución prevista

La estrategia futura de ejecución y tooling está documentada en:

- `docs/ARQUITECTURA_DEL_PLAYGROUND.md`

Este documento se enfoca solo en cómo ejecutar el repo en su estado actual.

### Estado actual del runner

En este momento `bin/run` ya resuelve una base bastante mejor que antes:

- ayuda;
- listado de ejemplos;
- modo `auto`;
- modo `local`;
- modo `docker`;
- validaciones y errores más claros.

### Próximo paso recomendado para entorno local

Seguir fortaleciendo el flujo local alrededor de:

- `mise.toml`;
- `bin/pre-setup-local`;
- `bin/setup local`.

---

## Recomendación práctica

Si querés usar el repo hoy sin vueltas:

1. probá primero con `bin/run`;
2. si necesitás más control, ejecutá manualmente con Docker Compose;
3. si querés máxima rapidez y ya tenés Ruby listo, usá ejecución local.

## Ejemplos rápidos para arrancar

```bash
bin/run basics types-and-booleans
bin/run basics simple-stats
bin/run cli mind-reader
bin/run networking tcp-client-basic
```

---

La idea de este playground no es complicarte la vida: es **elegir un ejemplo, correrlo y aprender algo concreto rápido**.
