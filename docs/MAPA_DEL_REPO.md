# Mapa del repositorio

## Objetivo

Este documento explica cómo está organizado el repositorio hoy, qué rol cumple cada parte y hacia qué estructura debería migrar para consolidarse como playground de Ruby.

La idea es que sirva como puente entre:

- el estado actual del repo;
- la estructura objetivo acordada;
- la futura migración por dominio técnico.

---

## Vista general actual

```text
.
├── README.md
├── docker-compose.yml
├── bin/
│   └── run
├── data/
│   └── texto.txt
├── docs/
│   ├── COMO_EJECUTAR.md
│   ├── ESTADO_ACTUAL.md
│   └── ARQUITECTURA_DEL_PLAYGROUND.md
└── examples/
    ├── basics/
    ├── cli/
    ├── collections/
    ├── experiments/
    ├── io/
    ├── networking/
    └── oop/
```

---

## Mapa por carpeta

### `README.md`

Puerta de entrada principal del repositorio.

### Rol

- explicar qué es el repo;
- mostrar cómo ejecutar ejemplos;
- dejar claro el alcance del playground.

### Estado

**Activo**.

---

### `docker-compose.yml`

Define el entorno contenedorizado para ejecutar scripts Ruby.

### Rol

- ofrecer una forma reproducible de correr ejemplos;
- facilitar ejecución interactiva;
- desacoplar la ejecución del entorno local.

### Estado

**Activo**.

### Observaciones

- usa `ruby:4.0.2`;
- mantiene `tty` y `stdin_open`;
- expone `3000:9292`, aunque hoy no hay una app web activa que lo necesite como parte central del playground.

---

### `bin/`

Contiene scripts utilitarios del repositorio.

#### `bin/run`

Script actual para ejecutar ejemplos por grupo.

### Rol

- simplificar la ejecución de scripts;
- abstraer la ruta física dentro de `examples/`;
- decidir entre Docker Compose y Ruby local según disponibilidad.

### Estado

**Activo**, pero con margen claro de mejora.

### Observaciones

- hoy soporta compatibilidad transitoria para `lecciones`, `practicas` y `socket`, además de las nuevas categorías por dominio;
- todavía no ofrece `list`, `--help` ni selección explícita entre local y Docker;
- más adelante se prevé la aparición de `bin/setup`.

---

### `data/`

Carpeta de datos auxiliares.

#### `data/texto.txt`

Archivo usado por ejemplos relacionados con lectura de archivos.

### Rol

- servir como recurso de entrada para ejemplos de IO.

### Estado

**Activo**.

---

### `docs/`

Documentación operativa y estratégica del playground.

### Archivos actuales

#### `docs/ESTADO_ACTUAL.md`

Describe el estado real del repositorio y sus diferencias entre working tree y Git.

**Rol:** diagnóstico.

#### `docs/ARQUITECTURA_DEL_PLAYGROUND.md`

Contiene la visión, los principios y la estructura objetivo del playground.

**Rol:** dirección y decisiones.

#### `docs/COMO_EJECUTAR.md`

Explica cómo correr ejemplos con `bin/run`, Docker Compose o Ruby local.

**Rol:** operación.

### Estado

**Activo y en crecimiento**.

### Observación

La carpeta `docs/` está empezando a convertirse en la capa formal de documentación del proyecto. Eso está bien, porque evita sobrecargar el README con demasiados detalles.

---

### `examples/`

Es el núcleo del playground.

Acá viven los ejemplos ejecutables del repositorio.

### Estado

**Activo**.

### Observación general

La estructura actual funciona, pero mezcla criterios pedagógicos y técnicos. Por eso se acordó migrar más adelante a una estructura por dominio técnico.

---

## Mapa de `examples/` en el estado actual

### Estado actual de la estructura por dominios

La estructura dominante del repositorio ya pasó a ser esta:

- `examples/basics/`
- `examples/cli/`
- `examples/collections/`
- `examples/experiments/`
- `examples/io/`
- `examples/networking/`
- `examples/oop/`

Los grupos históricos (`lecciones`, `practicas`, `socket`) ya no son la estructura activa del contenido. Hoy solo sobreviven como compatibilidad transitoria en `bin/run`.

## Contenido fuera del flujo activo

### `examples/template/`

Este contenido **ya no forma parte del playground activo**.

### Estado real

- no existe en el working tree actual;
- sí aparece todavía en Git como borrado pendiente.

### Decisión tomada

Debe eliminarse definitivamente del repositorio activo y no formar parte de la documentación futura como área vigente.

---

## Mapa de migración preliminar

Esto no es todavía una migración ejecutada. Es una guía de cómo pensar el traslado.

### Desde `lecciones/`

- fundamentos generales → `basics/`
- arrays / hashes / rangos → `basics/`
- clases / herencia → `basics/`
- archivos → `io/`
- GUI o casos raros → `experiments/`

### Estado de migración actual desde `lecciones/`

Primer lote ya migrado:

- `examples/lecciones/09.rb` → `examples/io/file-reading.rb`
- `examples/lecciones/10.rb` → `examples/experiments/tk-gui.rb`
- `examples/lecciones/11.rb` → `examples/io/user-input.rb`

Segundo lote ya migrado:

- `examples/lecciones/00.rb` → `examples/basics/types-and-booleans.rb`
- `examples/lecciones/01.rb` → `examples/basics/strings.rb`
- `examples/lecciones/07.rb` → `examples/basics/control-flow.rb`
- `examples/lecciones/12.rb` → `examples/basics/percent-notation-and-bang-methods.rb`

Tercer lote ya migrado:

- `examples/lecciones/02.rb` → `examples/collections/arrays-and-ranges.rb`
- `examples/lecciones/03.rb` → `examples/collections/hashes.rb`
- `examples/lecciones/08.rb` → `examples/collections/iterators-and-enumerators.rb`

Cuarto lote ya migrado:

- `examples/lecciones/04.rb` → `examples/oop/methods-classes-and-inheritance.rb`
- `examples/lecciones/05.rb` → `examples/oop/scope-and-metaprogramming.rb`
- `examples/lecciones/06.rb` → `examples/oop/singleton-methods-and-procs.rb`

### Compatibilidad transitoria

Durante esta etapa, `bin/run` mantiene compatibilidad con:

- `bin/run lecciones 09`
- `bin/run lecciones 10`
- `bin/run lecciones 11`
- `bin/run lecciones 00`
- `bin/run lecciones 01`
- `bin/run lecciones 02`
- `bin/run lecciones 03`
- `bin/run lecciones 04`
- `bin/run lecciones 05`
- `bin/run lecciones 06`
- `bin/run lecciones 07`
- `bin/run lecciones 08`
- `bin/run lecciones 12`

aunque los archivos ya vivan en la nueva estructura.

### Desde `practicas/`

- scripts interactivos → `cli/`
- lectura / manejo de datos → `io/`
- ejercicios simples de lógica → `basics/`
- ejemplos más abiertos o raros → `experiments/`

### Estado de migración actual desde `practicas/`

Lote ya migrado:

- `examples/practicas/mind-reader.rb` → `examples/cli/mind-reader.rb`
- `examples/practicas/roller.rb` → `examples/cli/roller.rb`
- `examples/practicas/speed.rb` → `examples/basics/speed-rules.rb`
- `examples/practicas/simple_stats.rb` → `examples/basics/simple-stats.rb`
- `examples/practicas/math-method.rb` → `examples/oop/math-with-blocks.rb`
- `examples/practicas/get-data.rb` → `examples/experiments/get-data.rb`

### Compatibilidad transitoria

Durante esta etapa, `bin/run` mantiene compatibilidad con:

- `bin/run practicas mind-reader`
- `bin/run practicas roller`
- `bin/run practicas speed`
- `bin/run practicas simple_stats`
- `bin/run practicas math-method`
- `bin/run practicas get-data`

aunque los archivos ya vivan en la nueva estructura.

### Desde `socket/`

- cliente / servidor TCP → `networking/`
- pruebas incompletas o inestables → `experiments/` si corresponde.

### Estado de migración actual desde `socket/`

Lote ya migrado:

- `examples/socket/08.rb` → `examples/networking/tcp-server-basic.rb`
- `examples/socket/09.rb` → `examples/networking/tcp-client-basic.rb`
- `examples/socket/10.rb` → `examples/experiments/tcp-broadcast-attempt.rb`
- `examples/socket/11.rb` → `examples/networking/tcp-client-interactive.rb`

### Compatibilidad transitoria

Durante esta etapa, `bin/run` mantiene compatibilidad con:

- `bin/run socket 08`
- `bin/run socket 09`
- `bin/run socket 10`
- `bin/run socket 11`

aunque los archivos ya vivan en la nueva estructura.

## Cómo leer este mapa

Este documento no reemplaza la ejecución ni la documentación de uso.

Su función es otra:

- entender qué hay hoy;
- identificar qué está activo;
- ver hacia dónde debería evolucionar cada parte.

## Relación con otros documentos

- `README.md` → entrada rápida al repo.
- `docs/ESTADO_ACTUAL.md` → diagnóstico del estado real.
- `docs/COMO_EJECUTAR.md` → guía operativa de ejecución.
- `docs/ARQUITECTURA_DEL_PLAYGROUND.md` → visión, principios y estructura objetivo.

---

En resumen: este mapa existe para que el repo deje de ser una colección de carpetas con historia y pase a ser una estructura entendible, mantenible y preparada para crecer con criterio.
