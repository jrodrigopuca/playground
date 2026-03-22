# Estado actual del repositorio

## Resumen ejecutivo

Hoy el repo sigue siendo, en esencia, un **playground de Ruby** orientado a aprendizaje y práctica manual.

La diferencia importante respecto al relevamiento anterior es esta: el árbol de trabajo **ya no contiene `examples/template/`**, aunque esa carpeta **todavía figura como parte del historial de Git y aparece marcada como eliminada** en el estado actual.

O sea: el repo está en un estado medio híbrido.

- Como contenido activo visible, quedó enfocado en scripts Ruby de consola y ejemplos chicos.
- Como estado Git, hay una limpieza grande sin confirmar sobre la plantilla web experimental.

## Qué refleja el código hoy

Por estructura y archivos realmente presentes en el working tree, este repo hoy parece servir para:

- aprender fundamentos de Ruby;
- practicar con scripts interactivos;
- probar sockets y un ejemplo mínimo de GraphQL;
- ejecutar ejemplos manualmente con `bin/run` o Docker Compose.

## Estructura actual del working tree

```text
.
├── README.md
├── docker-compose.yml
├── bin/
│   └── run
├── data/
│   └── texto.txt
├── docs/
│   └── ESTADO_ACTUAL.md
└── examples/
    ├── lecciones/
    ├── practicas/
    ├── socket/
    └── graph/
```

## Diferencia entre working tree y Git

Acá está el punto clave, loco: **el árbol actual y lo trackeado por Git no coinciden**.

### En el working tree actual

- existe `docs/ESTADO_ACTUAL.md` como archivo nuevo no trackeado;
- **no existe** `examples/template/`.

### En Git (`HEAD`)

Sí siguen figurando archivos de `examples/template/`, por ejemplo:

- `examples/template/Gemfile`
- `examples/template/config.ru`
- `examples/template/HamlApp.rb`
- vistas Haml, JS y SCSS dentro de `source/`

### Estado observado

Entonces, técnicamente, el repo hoy está así:

- la carpeta `examples/template/` **formaba parte del repo**;
- en el árbol actual fue **borrada completa**;
- ese borrado **todavía no está consolidado en un commit**.

## Tecnologías y dependencias detectadas

### Base activa del repositorio

- **Ruby** como lenguaje principal.
- **Docker Compose** para ejecución aislada.
- script `bin/run` para ejecutar ejemplos por grupo.

### Tecnologías visibles en ejemplos activos

- `socket` estándar de Ruby en `examples/socket/`
- `graphql` en `examples/graph/01.rb`
- `tk` en `examples/lecciones/10.rb`

### Tecnologías históricas o actualmente removidas del working tree

Por lo que Git todavía registra en `HEAD`, existía una mini plantilla web con:

- **Haml**
- **SCSS / Sass**
- **Rack**
- **Puma**

Pero OJO: eso hoy no está presente en el árbol de trabajo. Así que no corresponde describirlo como parte operativa actual, sino como contenido eliminado pendiente de confirmar.

## Estado por área

### 1. `examples/lecciones/`

Sigue siendo la zona más consistente del repo.

- contiene `00.rb` a `12.rb`;
- cubre fundamentos de Ruby;
- el enfoque es claramente didáctico.

**Estado:** material educativo estable.

### 2. `examples/practicas/`

Agrupa scripts chicos y ejercicios manuales.

Ejemplos presentes:

- `mind-reader.rb`
- `roller.rb`
- `speed.rb`
- `simple_stats.rb`
- `math-method.rb`
- `get-data.rb`

**Estado:** práctica manual, sin estructura de app ni librería.

### 3. `examples/socket/`

Incluye pruebas de cliente/servidor TCP.

- `08.rb`: servidor básico
- `09.rb`: cliente básico
- `10.rb` y `11.rb`: variantes más experimentales

**Estado:** experimental.

**Hallazgo importante:** `examples/socket/10.rb` sigue teniendo un problema real de alcance. El método `comunicar` usa `clientes`, pero esa variable fue declarada fuera del método y no está disponible ahí como variable local normal.

### 4. `examples/graph/`

Tiene un único archivo `01.rb` con un ejemplo mínimo de GraphQL.

**Estado:** demo aislada.

**Observación:** no hay un entorno de dependencias unificado en la raíz para garantizar ejecución directa de ese ejemplo.

### 5. `examples/template/`

Acá cambió fuerte el panorama.

**Estado actual en el working tree:** ausente.

**Estado en Git:** carpeta trackeada pero actualmente marcada como eliminada.

Conclusión práctica: hoy **no debe considerarse parte operativa del repo actual**, aunque siga existiendo en el historial y en el índice como borrado pendiente.

## Ejecución actual del repo

### Mecanismos disponibles

El repo hoy ofrece dos formas claras de ejecución:

1. **Docker Compose**
2. **`bin/run`**

### `docker-compose.yml`

El servicio `ruby`:

- usa imagen `ruby:3.3`;
- monta el repo en `/app`;
- mantiene `stdin_open` y `tty` para scripts interactivos;
- cachea gems en el volumen `bundle`;
- expone `3000:9292`, aunque en el working tree actual no hay app web activa que justifique ese puerto.

### Script `bin/run`

Permite ejecutar ejemplos de:

- `lecciones`
- `practicas`
- `socket`
- `graph`

Ejemplos:

```bash
bin/run lecciones 00
bin/run practicas mind-reader
bin/run socket 08
bin/run graph 01
```

Si detecta Docker Compose, ejecuta dentro del contenedor. Si no, intenta con Ruby local.

## Estado de documentación existente

### README principal

El `README.md` ya está mejor alineado con la identidad actual del repo:

- presenta al repositorio como playground de Ruby;
- usa rutas reales;
- muestra a `bin/run` como interfaz principal;
- referencia la documentación complementaria en `docs/`.

### Documentación en `docs/`

La documentación hoy ya está más modular y separada por responsabilidad:

- `docs/ESTADO_ACTUAL.md` → diagnóstico del estado real;
- `docs/ARQUITECTURA_DEL_PLAYGROUND.md` → visión, principios y estructura objetivo;
- `docs/COMO_EJECUTAR.md` → guía operativa de ejecución;
- `docs/MAPA_DEL_REPO.md` → mapa actual del repositorio;
- `docs/COMO_AGREGAR_EJEMPLOS.md` → estándar para nuevos ejemplos.

### Observación importante

Aunque la taxonomía documental ya está bastante mejor resuelta, la carpeta `docs/` sigue apareciendo como contenido nuevo no trackeado mientras no se consoliden estos archivos en Git.

## Calidad y mantenibilidad

### Lo positivo

- estructura simple de entender;
- propósito educativo bastante claro;
- separación razonable por carpetas;
- Docker Compose facilita reproducibilidad básica;
- `bin/run` mejora bastante la experiencia de ejecución.

### Lo que sigue faltando

- **tests automatizados**;
- **CI/CD**;
- **Gemfile raíz** para entorno unificado;
- linting o validación de estilo;
- definición explícita de qué contenido sigue vigente y qué contenido se está retirando.

### Ajuste de diagnóstico

El punto “documentación sincronizada con la estructura real” ya no debería leerse igual que antes.

Hoy el problema principal ya no es la ausencia de documentación, sino que todavía falta:

- consolidarla en Git;
- sostenerla actualizada cuando empiece la migración de carpetas;
- acompañarla con cambios reales en tooling y estructura.

## Estado actual de Git

Al momento de este relevamiento:

- rama actual: `master`
- tracking remoto: `origin/master`
- hay cambios locales
- `docs/` aparece como contenido nuevo no trackeado
- `examples/template/` aparece completo como borrado pendiente

En otras palabras: el repo **no está limpio**.

## Diagnóstico general

Si te lo digo bien de frente: esto sigue siendo un **cuaderno de laboratorio Ruby**, y está perfecto si ese es el objetivo.

Lo que ya no podés hacer es describirlo como si todavía tuviera una mini app web experimental viva dentro del árbol actual, porque **hoy esa parte está borrada del working tree**.

Entonces el estado real es este:

- playground Ruby activo: **sí**
- scripts manuales ejecutables: **sí**
- material educativo: **sí**
- app web/template activa dentro del repo actual: **no**
- repo limpio y alineado con la documentación: **todavía no**

## Recomendaciones priorizadas

### Alta prioridad

1. **Confirmar en Git la salida de `examples/template/`**.
2. **Consolidar en Git la nueva capa documental** (`README`, arquitectura, ejecución, mapa y guía de ejemplos).
3. **Empezar a traducir la dirección definida en docs a cambios reales de tooling y estructura**.

### Prioridad media

4. Revisar `docker-compose.yml` y decidir si el mapeo de puertos `3000:9292` sigue teniendo sentido.
5. Definir el alcance inicial de `bin/setup`.
6. Diseñar la migración desde `lecciones` / `practicas` / `socket` / `graph` hacia la estructura objetivo.

### Prioridad baja

7. Agregar tests mínimos donde tenga sentido.
8. Homogeneizar estilo y mensajes de los scripts.
9. Limpiar `.DS_Store` y considerar ignorarlos explícitamente.

## Conclusión

El repositorio está hoy en un estado **didáctico, exploratorio y con limpieza pendiente en Git**.

Sirve bien para:

- aprender Ruby;
- correr scripts manuales;
- hacer pruebas chicas.

No está hoy listo para asumirse como:

- aplicación web activa;
- librería reusable;
- proyecto con garantías automáticas de calidad;
- repo prolijamente mantenido sin cambios pendientes.

El siguiente paso lógico ahora ya no es seguir escribiendo más documentación.

El siguiente paso lógico es este:

1. **consolidar en Git la limpieza documental y la salida de `examples/template/`**;
2. **empezar a implementar la evolución definida en la arquitectura del playground**.
