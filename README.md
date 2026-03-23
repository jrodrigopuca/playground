# Ruby Playground

Repositorio orientado a **exploración práctica y rápida de Ruby**.

La idea de este proyecto es simple: tener ejemplos chicos, ejecutables y fáciles de entender para practicar conceptos, probar ideas y aprender sin convertir el repo en una aplicación grande o en una librería formal.

## Qué es este repositorio

Este repo es un **playground de Ruby**.

Está pensado para:

- practicar fundamentos del lenguaje;
- ejecutar scripts pequeños y autocontenidos;
- experimentar con ejemplos de consola, archivos, sockets y gems puntuales;
- aprender rápido a partir de casos concretos.

## Qué NO es este repositorio

Este repo **no** busca ser:

- una app web productiva;
- una librería reusable;
- un template genérico de aplicación;
- un conjunto de ejemplos acoplados a una arquitectura grande.

## Estructura actual

Hoy el repo está organizado así:

```text
.
├── README.md
├── docker-compose.yml
├── bin/
│   └── run
├── data/
│   └── texto.txt
├── docs/
│   ├── ESTADO_ACTUAL.md
│   └── ARQUITECTURA_DEL_PLAYGROUND.md
└── examples/
    ├── graph/
    ├── lecciones/
    ├── practicas/
    └── socket/
```

### Carpetas activas

- `examples/lecciones/`: ejemplos de fundamentos y conceptos base de Ruby.
- `examples/practicas/`: ejercicios cortos y scripts de práctica manual.
- `examples/socket/`: pruebas experimentales con sockets TCP.
- `examples/graph/`: ejemplo puntual con GraphQL.

## Cómo ejecutar ejemplos

La interfaz principal actual es `bin/run`.

### Uso general

```bash
bin/run <grupo> <archivo-sin-ext>
```

### Grupos disponibles hoy

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

## Cómo funciona `bin/run`

El script intenta ejecutar de esta manera:

1. si Docker Compose está disponible, usa contenedor;
2. si no, intenta ejecutar con Ruby local.

Eso permite mantener una experiencia simple sin obligarte a recordar rutas largas dentro de `examples/`.

## Ejecución con Docker Compose

Si querés ejecutar cosas manualmente con Docker Compose, hoy el repo trae un servicio `ruby` basado en `ruby:4.0.2`.

Ejemplos:

```bash
# Abrir IRB
docker compose run --rm ruby irb

# Ejecutar un script de forma manual
docker compose run --rm ruby ruby examples/lecciones/00.rb

# Ejecutar un script interactivo
docker compose run --rm ruby ruby examples/practicas/mind-reader.rb
```

## Ejecución local

Si no usás Docker, también podés correr ejemplos con Ruby instalado localmente:

```bash
ruby examples/lecciones/00.rb
ruby examples/practicas/mind-reader.rb
```

O, mejor todavía, usar:

```bash
bin/run lecciones 00
```

## Documentación disponible

- `docs/ESTADO_ACTUAL.md`: relevamiento del estado real del repo.
- `docs/ARQUITECTURA_DEL_PLAYGROUND.md`: visión, principios y estructura objetivo del playground.
- `docs/COMO_EJECUTAR.md`: guía operativa de ejecución.
- `docs/MAPA_DEL_REPO.md`: mapa actual del repositorio.
- `docs/COMO_AGREGAR_EJEMPLOS.md`: estándar para sumar ejemplos nuevos.

## Dependencias del playground

El repo ya cuenta con un `Gemfile` raíz mínimo.

### Dependencias soportadas por Bundler

- `graphql`

### Dependencias especiales

- `tk` sigue considerándose una dependencia especial del sistema y no forma parte del `Gemfile` raíz por ahora.

---

Si querés usar este repo como playground, pensalo así: **entrar, elegir un ejemplo, ejecutarlo y aprender algo concreto sin vueltas**.
