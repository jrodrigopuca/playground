# Cómo agregar ejemplos a este playground

## Objetivo

Este documento define la regla de juego para agregar nuevos ejemplos al repositorio.

La idea es simple: si el playground quiere crecer sin convertirse en un quilombo, cada ejemplo nuevo tiene que entrar con criterio.

No alcanza con que “funcione”. Tiene que:

- tener un propósito claro;
- ser fácil de ejecutar;
- encajar en la estructura del repo;
- aportar aprendizaje real.

---

## Qué tipo de ejemplos sí entran

Un ejemplo nuevo debería entrar al repo si cumple una o varias de estas condiciones:

- demuestra un concepto concreto de Ruby;
- permite aprender algo rápido;
- sirve como experimento técnico chico y entendible;
- ilustra una librería o API puntual sin meter complejidad innecesaria;
- puede ejecutarse de forma relativamente directa.

## Qué tipo de ejemplos NO deberían entrar

No conviene agregar ejemplos que:

- parezcan una mini app disfrazada de script;
- tengan demasiada complejidad para el valor educativo que aportan;
- dependan de demasiada configuración oculta;
- no tengan objetivo claro;
- estén rotos y no lo indiquen;
- solo sirvan como “archivo suelto” sin contexto.

---

## Principios para aceptar un ejemplo nuevo

Antes de agregar algo, conviene responder estas preguntas:

1. **¿Qué concepto quiero mostrar?**
2. **¿Se entiende rápido?**
3. **¿Dónde debería vivir dentro del repo?**
4. **¿Cómo lo va a ejecutar alguien que no conoce este proyecto?**
5. **¿Necesita dependencias especiales?**
6. **¿Es estable o experimental?**

Si no podés responder eso, el ejemplo todavía no está listo para entrar.

---

## Estructura objetivo para ubicar ejemplos

La estructura objetivo del repositorio y el sentido de cada categoría están definidos en:

- `docs/ARQUITECTURA_DEL_PLAYGROUND.md`

Este documento usa esa estructura como regla operativa para decidir dónde ubicar ejemplos nuevos.

## Cómo decidir la carpeta correcta

### `basics/`

Para ejemplos de fundamentos del lenguaje.

Ejemplos típicos:

- variables;
- tipos básicos;
- operadores;
- condicionales;
- loops simples.
- arrays;
- hashes;
- rangos;
- iteración;
- transformaciones simples.
- clases;
- objetos;
- herencia;
- encapsulación;
- módulos usados con sentido OO.

### `io/`

Para ejemplos de entrada/salida y manejo de archivos.

Ejemplos típicos:

- lectura de archivos;
- escritura de archivos;
- parseo simple de datos;
- uso de recursos dentro de `data/`.

### `cli/`

Para scripts que interactúan con usuario o consola.

Ejemplos típicos:

- uso de `gets`;
- scripts interactivos;
- pequeños asistentes de línea de comandos.

### `networking/`

Para ejemplos de red.

Ejemplos típicos:

- sockets;
- cliente/servidor TCP;
- comunicación simple por red.

### `gems/`

Para ejemplos que dependen de gems externas.

Ejemplos típicos:

- GraphQL;
- parsing especializado con librerías;
- gems que ilustran un concepto puntual.

### `experiments/`

Para material exploratorio o todavía inestable.

Esto no debería ser un basurero. Debería usarse cuando el ejemplo:

- todavía no encaja bien en una categoría estable;
- está en exploración;
- requiere validación posterior.

---

## Convención mínima por ejemplo

Cada ejemplo nuevo debería incluir una cabecera al inicio del archivo.

### Plantilla recomendada

```ruby
# Objetivo:
# Cómo funciona:
# Resultado esperado:
# Dependencias:
# Estado: estable | experimental
# Fecha de modificación:
```

## Qué significa cada campo

### `Objetivo`

Explica qué concepto demuestra el ejemplo.

### `Cómo funciona`

Resume la lógica general del script en una o dos líneas.

### `Resultado esperado`

Explica qué debería pasar al ejecutarlo.

### `Dependencias`

Aclara si usa:

- solo stdlib;
- una gem externa;
- dependencias del sistema.

### `Estado`

Debe indicar al menos una de estas opciones:

- `estable`
- `experimental`

### `Fecha de modificación`

Sirve para dejar trazabilidad mínima del último ajuste relevante.

---

## Reglas de naming

### Para nombres de archivo

Los nombres deberían:

- describir el tema;
- evitar ambigüedad innecesaria;
- evitar nombres demasiado genéricos si el repo crece;
- mantenerse simples.

### Ejemplos de buenos nombres

- `array-iteration.rb`
- `file-reading.rb`
- `tcp-server-basic.rb`
- `graphql-basic-query.rb`

### Ejemplos de malos nombres

- `test.rb`
- `nuevo.rb`
- `ejemplo1.rb`
- `cosas.rb`

### Excepción temporal

El repo actual todavía conserva varios nombres históricos (`00.rb`, `01.rb`, etc.).

Eso se tolera como parte del estado actual, pero **no debería ser la convención para ejemplos nuevos**.

---

## Reglas de complejidad

Un ejemplo del playground debería ser chico.

No hace falta imponer una cantidad exacta de líneas, pero sí una regla conceptual:

> si el ejemplo necesita demasiada explicación, demasiada configuración o demasiados archivos para demostrar una idea pequeña, probablemente está sobredimensionado.

## Señales de que un ejemplo se fue de mambo

- necesita demasiados archivos auxiliares;
- tiene múltiples responsabilidades;
- cuesta explicar qué enseña;
- parece el inicio de una aplicación más que un ejemplo;
- rompe la experiencia rápida del playground.

En ese caso hay dos opciones:

1. simplificarlo;
2. dividirlo en varios ejemplos más chicos.

---

## Dependencias: cuándo sí y cuándo no

El repo va camino a usar un `Gemfile` raíz, pero eso no significa que cualquier dependencia tenga que entrar.

### Una dependencia externa se justifica si:

- aporta valor educativo claro;
- el ejemplo no se entiende sin esa librería;
- sigue siendo mantenible;
- no mete complejidad absurda para un caso trivial.

### Una dependencia externa NO se justifica si:

- existe una forma mucho más simple de mostrar la misma idea;
- obliga a setup pesado para un beneficio mínimo;
- queda metida sin documentación.

### Regla práctica

Si agregás una gem externa, también deberías:

- documentarla en la cabecera del ejemplo;
- dejar claro por qué se usa;
- ayudar a que ese ejemplo siga siendo ejecutable sin magia escondida.

---

## Estable vs experimental

Todo ejemplo nuevo debería entrar marcado como `estable` o `experimental`.

### `estable`

Usalo cuando:

- el ejemplo cumple bien su objetivo;
- se puede ejecutar sin sorpresas grandes;
- su valor educativo está claro.

### `experimental`

Usalo cuando:

- el ejemplo está explorando algo;
- puede cambiar bastante;
- todavía no está totalmente pulido;
- querés conservarlo sin venderlo como material consolidado.

Lo importante acá es no mentirle al repo. Si algo está verde, se marca como verde.

---

## Checklist antes de agregar un ejemplo

Antes de incorporar un ejemplo nuevo, revisá esto:

- [ ] tiene objetivo claro;
- [ ] encaja en una categoría del repo;
- [ ] se puede ejecutar razonablemente fácil;
- [ ] tiene cabecera mínima completa;
- [ ] el nombre del archivo describe el tema;
- [ ] sus dependencias están explícitas;
- [ ] está marcado como `estable` o `experimental`;
- [ ] no introduce complejidad desproporcionada.

---

## Checklist después de agregar un ejemplo

- [ ] probé que el ejemplo realmente corre;
- [ ] confirmé que su ubicación en `examples/` tiene sentido;
- [ ] actualicé documentación si hacía falta;
- [ ] revisé si `bin/run` o futuros scripts necesitan contemplarlo;
- [ ] verifiqué que el ejemplo aporte algo distinto y no sea duplicado inútil.

---

## Ejemplo de plantilla completa

```ruby
# Objetivo: mostrar cómo iterar un array en Ruby.
# Cómo funciona: crea un array de números y recorre cada elemento con `each`.
# Resultado esperado: imprime cada número en consola en orden.
# Dependencias: stdlib.
# Estado: estable
# Fecha de modificación: 2026-03-22

numbers = [1, 2, 3]

numbers.each do |number|
  puts number
end
```

---

## Relación con otros documentos

- `README.md` → explica qué es el repo y cómo empezar.
- `docs/COMO_EJECUTAR.md` → explica cómo correr ejemplos.
- `docs/MAPA_DEL_REPO.md` → explica dónde vive cada cosa y hacia dónde migra.
- `docs/ARQUITECTURA_DEL_PLAYGROUND.md` → documenta visión, principios y estructura objetivo.

---

En resumen: agregar ejemplos a este repo no debería ser “tirar un archivo más”. Debería ser sumar una pieza que tenga sentido, se pueda ejecutar fácil y ayude a que el playground crezca con criterio, no con ruido.
