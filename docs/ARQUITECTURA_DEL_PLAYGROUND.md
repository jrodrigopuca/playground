# Arquitectura del playground

## Objetivo

Este documento define la visión, los principios y las decisiones estructurales del repositorio.

Su función no es explicar cómo ejecutar ejemplos ni describir el estado Git del proyecto. Su función es dejar claro:

- qué es este repo;
- qué tipo de material acepta;
- cómo debería organizarse;
- hacia dónde evoluciona.

---

## Identidad del repositorio

Este repositorio es un **playground de Ruby orientado a exploración práctica y rápida**.

Está pensado para contener ejemplos pequeños, ejecutables y fáciles de entender, de manera que una persona pueda entrar, correr algo y aprender un concepto concreto sin demasiada fricción.

## Qué debería ser

- un espacio para practicar Ruby;
- un repositorio de ejemplos chicos y autocontenidos;
- una base educativa simple;
- un entorno preparado para crecer sin requerir cambios grandes de configuración.

## Qué no debería ser

- una app web productiva;
- una librería reusable;
- un template genérico de aplicación;
- un depósito de experimentos sin criterio.

---

## Principios del playground

### 1. Aprendizaje rápido

Cada ejemplo debería enseñar algo concreto sin depender de una arquitectura grande alrededor.

### 2. Baja complejidad

El playground no debería convertirse en una mini app fragmentada. Si algo crece demasiado, hay que simplificarlo o dividirlo.

### 3. Ejecución simple

El repo debe facilitar ejecutar ejemplos con la menor fricción posible, tanto localmente como con Docker.

### 4. Estructura escalable

El crecimiento del repositorio tiene que sostenerse con una organización clara, no con carpetas ambiguas o históricas eternizadas.

### 5. Documentación útil

Cada documento y cada ejemplo deberían existir por una razón concreta. Nada de duplicar texto porque sí.

---

## Decisiones tomadas

### 1. `examples/template/` queda fuera del playground

Ese contenido ya no forma parte del objetivo del repositorio.

### 2. El repo se orienta a ejemplos pequeños y ejecutables

La prioridad no es la sofisticación, sino el valor educativo y la facilidad de uso.

### 3. La estructura debe migrar a dominios técnicos

La organización futura no debería depender de nombres ambiguos como `lecciones` o `practicas`.

### 4. Habrá una convención mínima para nuevos ejemplos

Todo ejemplo nuevo debería entrar con cabecera, estado declarado y criterio de ubicación.

### 5. La experiencia de ejecución debe mejorar

`bin/run` seguirá siendo la interfaz principal, pero deberá crecer. También se contempla separar preparación de entorno y ejecución.

---

## Estructura actual vs estructura objetivo

### Estructura actual

Hoy el repo todavía conserva esta organización principal dentro de `examples/`:

```text
examples/
  lecciones/
  practicas/
  socket/
```

### Problema de la estructura actual

- mezcla criterio pedagógico con criterio técnico;
- escala mal;
- obliga a interpretar demasiado el nombre de cada carpeta.

### Estructura objetivo

La dirección acordada es migrar a algo así:

```text
examples/
  basics/
  io/
  cli/
  networking/
  gems/
  experiments/
```

## Sentido de cada categoría objetivo

### `basics/`

Fundamentos del lenguaje, estructuras y orientación a objetos básica.

### `io/`

Archivos, entrada/salida y trabajo con recursos auxiliares.

### `cli/`

Scripts interactivos y ejemplos de consola.

### `networking/`

Sockets y comunicación cliente/servidor.

### `gems/`

Ejemplos que dependen de gems externas específicas.

### `experiments/`

Casos exploratorios o inestables que todavía no deben tratarse como material consolidado.

---

## Convención mínima para ejemplos nuevos

Todo ejemplo nuevo debería declarar al menos:

- objetivo;
- cómo funciona;
- resultado esperado;
- dependencias;
- estado (`estable` o `experimental`);
- fecha de modificación.

### Plantilla mínima sugerida

```ruby
# Objetivo:
# Cómo funciona:
# Resultado esperado:
# Dependencias:
# Estado: estable | experimental
# Fecha de modificación:
```

Además:

- el nombre del archivo debería describir el tema;
- no deberían agregarse nombres históricos como `00.rb` para nuevos ejemplos;
- si un ejemplo es experimental, debe decirlo explícitamente.

---

## Estrategia de dependencias

La dirección acordada es usar un **`Gemfile` raíz**, pero de forma disciplinada.

### Reglas

- incluir solo dependencias realmente necesarias;
- evitar convertir el repo en una bolsa de gems sin criterio;
- documentar qué ejemplos usan dependencias externas cuando aplique.

### Estado actual

El `Gemfile` raíz inicial del playground queda limitado, por ahora, a dependencias realmente necesarias y portables.

En esta etapa no incluye gems activas del playground.

Y deja fuera, por ahora:

- `tk`, por su mayor dependencia del sistema y menor portabilidad.

---

## Estrategia de ejecución

La interfaz principal del repositorio debería seguir siendo `bin/run`.

### Dirección de mejora

- agregar ayuda;
- listar ejemplos o categorías;
- permitir elegir entre modo local y Docker de forma explícita;
- mejorar mensajes de error.

También se contempla la aparición de `bin/setup` para separar:

- preparación de entorno;
- ejecución de ejemplos.

### Consideración importante para entorno local

En macOS, no conviene asumir como base el Ruby provisto por el sistema operativo.

Motivos:

- suele venir desactualizado respecto al entorno objetivo del repo;
- mezclar gems ahí puede afectar el entorno local del sistema;
- genera diferencias innecesarias frente al runtime usado en Docker.

### Dirección recomendada para entorno local

El flujo local debería incorporar una capa previa de preparación del runtime, separada del setup del proyecto.

#### Responsabilidades esperadas

- `bin/pre-setup-local` → preparar un Ruby moderno y aislado del sistema;
- `bin/setup` → validar entorno e instalar dependencias del proyecto;
- `bin/run` → ejecutar ejemplos.

### Estrategia sugerida

- usar un version manager moderno para Ruby;
- alinear la versión local con la versión base usada en Docker;
- evitar instalar gems del proyecto sobre el Ruby del sistema.

### Recomendación actual

La estrategia adoptada es usar **`mise`** como version manager para el flujo local y apuntar a una versión moderna de Ruby alineada con Docker (`4.0.2`) mediante `mise.toml`.

---

## Roadmap de evolución

### Fase 1 — Identidad y perímetro

- limpiar el foco del repo;
- alinear README y documentación base;
- consolidar la salida de `examples/template/`.

### Fase 2 — Estructura

- definir el mapa de migración;
- reorganizar el contenido por dominio técnico;
- establecer reglas claras para ejemplos nuevos.

### Fase 3 — Experiencia de uso

- mejorar `bin/run`;
- incorporar `bin/setup` si hace falta;
- ordenar dependencias y detalles operativos.

---

## Relación con otros documentos

- `README.md` → puerta de entrada rápida.
- `docs/ESTADO_ACTUAL.md` → diagnóstico del repo hoy.
- `docs/COMO_EJECUTAR.md` → ejecución operativa.
- `docs/MAPA_DEL_REPO.md` → mapa actual del repositorio.
- `docs/COMO_AGREGAR_EJEMPLOS.md` → estándar para sumar ejemplos.

---

En resumen: este documento existe para mantener la dirección del playground clara. Si el repo crece, tiene que crecer con criterio, con estructura y con foco educativo. No por acumulación.
