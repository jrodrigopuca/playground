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
    ├── graph/
    ├── lecciones/
    ├── practicas/
    └── socket/
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

- hoy soporta `lecciones`, `practicas`, `socket` y `graph`;
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

### `examples/lecciones/`

Contiene ejemplos numerados orientados a fundamentos del lenguaje.

### Contenido visible

- `00.rb`
- `01.rb`
- `02.rb`
- `03.rb`
- `04.rb`
- `05.rb`
- `06.rb`
- `07.rb`
- `08.rb`
- `09.rb`
- `10.rb`
- `11.rb`
- `12.rb`

### Rol actual

- base educativa del repo;
- introducción a conceptos centrales de Ruby.

### Estado

**Activo y relativamente estable**.

### Tipo de contenido

- fundamentos;
- estructuras de datos;
- métodos;
- clases;
- control de flujo;
- archivos;
- GUI (`tk`).

### Destino probable en la futura estructura

No debería quedar como una sola carpeta monolítica. Lo razonable sería repartir su contenido entre dominios como:

- `basics/`
- `io/`
- `experiments/`

---

### `examples/practicas/`

Contiene ejercicios cortos y scripts manuales.

### Contenido visible

- `mind-reader.rb`
- `roller.rb`
- `speed.rb`
- `simple_stats.rb`
- `math-method.rb`
- `get-data.rb`

### Rol actual

- práctica manual;
- pequeños ejercicios de entrada/salida y lógica.

### Estado

**Activo**.

### Tipo de contenido

- scripts de consola;
- ejercicios cortos;
- ejemplos interactivos.

### Destino probable en la futura estructura

Podría distribuirse entre:

- `cli/`
- `io/`
- `basics/`
- `experiments/`

---

### `examples/socket/`

Contiene pruebas de comunicación TCP.

### Contenido visible

- `08.rb`
- `09.rb`
- `10.rb`
- `11.rb`

### Rol actual

- experimentación con networking;
- pruebas de cliente/servidor.

### Estado

**Activo pero experimental**.

### Observaciones

- `08.rb` y `09.rb` representan la base más clara de servidor/cliente;
- `10.rb` tiene un problema de alcance con la variable `clientes`;
- el grupo completo debería considerarse material de experimentación técnica.

### Destino probable en la futura estructura

- `networking/`
- eventualmente algunos casos podrían marcarse explícitamente como `experiments/`.

---

### `examples/graph/`

Contiene un ejemplo mínimo vinculado a GraphQL.

### Contenido visible

- `01.rb`

### Rol actual

- ejemplo puntual con dependencia externa;
- demostración aislada de uso de gem.

### Estado

**Activo, pero muy acotado**.

### Observaciones

- no representa una categoría completa todavía;
- conceptualmente encaja más como ejemplo de gem externa que como dominio amplio.

### Destino probable en la futura estructura

- `gems/`
- o `experiments/`, según cómo evolucione el repo.

---

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

### Desde `practicas/`

- scripts interactivos → `cli/`
- lectura / manejo de datos → `io/`
- ejercicios simples de lógica → `basics/`
- ejemplos más abiertos o raros → `experiments/`

### Desde `socket/`

- cliente / servidor TCP → `networking/`
- pruebas incompletas o inestables → `experiments/` si corresponde.

### Desde `graph/`

- ejemplo con GraphQL → `gems/`

---

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
