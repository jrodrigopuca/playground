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

- un grupo;
- un archivo sin extensión;
- argumentos opcionales.

Luego construye la ruta dentro de `examples/` y ejecuta el script.

### Sintaxis

```bash
bin/run <grupo> <archivo-sin-ext> [args...]
```

### Grupos válidos hoy

- `lecciones`
- `practicas`
- `socket`
- `graph`

### Ejemplos

```bash
bin/run lecciones 00
bin/run practicas mind-reader
bin/run socket 08
bin/run graph 01
```

### Cómo decide si usa Docker o local

El comportamiento actual del script es este:

1. si encuentra `docker` y `docker compose`, ejecuta dentro del contenedor;
2. si no, intenta ejecutar con Ruby local.

### Importante

Hoy `bin/run` **no** pregunta qué modo querés usar.

Si Docker Compose está disponible, lo prioriza automáticamente.

Eso más adelante probablemente cambie, porque el plan del repo contempla una mejora para hacer más explícita la selección entre:

- modo local;
- modo Docker.

---

## Ejecución manual con Docker Compose

### Requisitos

- tener Docker instalado;
- tener Docker Compose disponible con `docker compose`.

### Qué ofrece el contenedor actual

El servicio `ruby` definido en `docker-compose.yml`:

- usa `ruby:3.3`;
- monta el repo en `/app`;
- mantiene `stdin_open` y `tty`, así que los scripts interactivos funcionan mejor;
- cachea gems en el volumen `bundle`.

### Comandos útiles

```bash
# Abrir IRB
docker compose run --rm ruby irb

# Ejecutar un ejemplo directamente
docker compose run --rm ruby ruby examples/lecciones/00.rb

# Ejecutar un script interactivo
docker compose run --rm ruby ruby examples/practicas/mind-reader.rb

# Ejecutar un ejemplo de sockets
docker compose run --rm ruby ruby examples/socket/08.rb
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

### Ejemplos

```bash
ruby examples/lecciones/00.rb
ruby examples/practicas/mind-reader.rb
ruby examples/socket/08.rb
ruby examples/graph/01.rb
```

### Cuándo conviene usar local

Usar Ruby local conviene cuando querés:

- velocidad de ejecución inmediata;
- probar cosas simples sin levantar contenedores;
- iterar rápido en ejemplos chicos.

### Riesgo actual del modo local

Como el repo todavía no tiene un entorno unificado de dependencias en raíz, algunos ejemplos pueden requerir setup adicional en tu máquina.

---

## Ejemplos interactivos

Algunos scripts esperan entrada del usuario usando `gets`.

Ejemplo:

```bash
bin/run practicas mind-reader
```

O manualmente:

```bash
docker compose run --rm ruby ruby examples/practicas/mind-reader.rb
```

Gracias a que el contenedor actual tiene `stdin_open` y `tty`, este tipo de scripts debería comportarse razonablemente bien dentro de Docker.

---

## Dependencias especiales

No todos los ejemplos usan solo la librería estándar.

### Casos detectados en el repo actual

- `examples/socket/*` usa `socket` de Ruby;
- `examples/graph/01.rb` usa `graphql`;
- `examples/lecciones/10.rb` usa `tk`.

### Qué implica esto

- algunos ejemplos correrán sin problema en una instalación Ruby estándar;
- otros pueden requerir gems o soporte adicional del entorno.

En el estado actual del repo, esto todavía no está centralizado en un `Gemfile` raíz.

---

## Problemas comunes

### 1. “No existe: examples/..."

Esto pasa cuando el grupo o el nombre del archivo no coinciden con un script real.

Ejemplo válido:

```bash
bin/run practicas roller
```

No hace falta poner `.rb`, aunque el script tolera que lo pases.

### 2. Docker está instalado pero querías correr local

Hoy `bin/run` prioriza Docker automáticamente si está disponible.

Si querés forzar modo local, por ahora tenés que ejecutar el script manualmente con `ruby`.

### 3. Falta una gem o dependencia del sistema

Esto puede pasar en ejemplos como GraphQL o `tk`.

En ese caso tenés dos caminos:

- preparar el entorno local con lo necesario;
- o correr dentro de Docker, si ese entorno resuelve mejor la dependencia.

---

## Evolución prevista

La estrategia futura de ejecución y tooling está documentada en:

- `docs/ARQUITECTURA_DEL_PLAYGROUND.md`

Este documento se enfoca solo en cómo ejecutar el repo en su estado actual.

---

## Recomendación práctica

Si querés usar el repo hoy sin vueltas:

1. probá primero con `bin/run`;
2. si necesitás más control, ejecutá manualmente con Docker Compose;
3. si querés máxima rapidez y ya tenés Ruby listo, usá ejecución local.

## Ejemplos rápidos para arrancar

```bash
bin/run lecciones 00
bin/run practicas simple_stats
bin/run socket 08
bin/run graph 01
```

---

La idea de este playground no es complicarte la vida: es **elegir un ejemplo, correrlo y aprender algo concreto rápido**.
