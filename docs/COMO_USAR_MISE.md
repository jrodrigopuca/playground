# Cómo usar `mise.toml` en este repositorio

## Objetivo

Este documento explica cómo se usa `mise.toml` dentro del playground y por qué forma parte del flujo local recomendado.

La idea es simple: **no depender del Ruby del sistema**, especialmente en macOS, y tener un runtime local más alineado con el entorno objetivo del repo.

---

## Qué es `mise`

`mise` es un version manager que permite fijar runtimes por proyecto.

En este repo lo usamos para declarar qué versión de Ruby debería usarse localmente.

## Qué hace `mise.toml`

En la raíz del repo existe este archivo:

```toml
[tools]
ruby = "4.0.2"
```

Eso significa:

- este proyecto espera trabajar con Ruby 4.0.2 a nivel local;
- `mise` usa este archivo como fuente de verdad para instalar y activar el runtime;
- el objetivo es alinear el entorno local con el runtime usado en Docker.

---

## Por qué esto importa

En el entorno relevado del proyecto se detectó:

- Ruby local: `2.6.10`
- Docker del repo: `ruby:4.0.2`

Ese desfasaje no está bueno.

¿Y por qué no está bueno?

- podés tener diferencias de comportamiento;
- podés instalar gems en un entorno viejo o acoplado al sistema;
- el debugging se vuelve más confuso;
- el flujo local deja de parecerse al flujo esperado del repo.

---

## Flujo recomendado

### 1. Instalar `mise`

En macOS, la recomendación es:

```bash
brew install mise
```

Después, tenés que activar `mise` en tu shell siguiendo su documentación oficial.

---

### 2. Verificar el estado local

El repo ya trae este comando:

```bash
bin/pre-setup-local check
```

Eso te muestra:

- si `mise` está disponible;
- qué Ruby estás usando;
- si ese Ruby parece ser el del sistema;
- qué versión está declarada en `mise.toml`.

---

### 3. Instalar el runtime definido en `mise.toml`

```bash
bin/pre-setup-local install
```

Ese comando usa `mise.toml` para preparar el runtime local del proyecto.

---

### 4. Preparar el entorno del proyecto

Después del runtime:

```bash
bin/setup local
```

Y luego ya podés ejecutar ejemplos:

```bash
bin/run local lecciones 00
```

---

## Flujo completo recomendado

```bash
bin/pre-setup-local check
bin/pre-setup-local install
bin/setup local
bin/run local lecciones 00
```

---

## Cómo verificar que `mise` está actuando sobre el proyecto

Podés usar:

```bash
mise current
```

Eso debería mostrar la versión de Ruby que `mise.toml` definió para este repo.

También podés verificar con:

```bash
ruby -v
```

La expectativa es que ya no estés usando el Ruby viejo del sistema.

---

## Qué NO hace `mise.toml`

Importante:

`mise.toml` **no instala las dependencias del proyecto** por sí solo.

Su responsabilidad es otra:

- fijar la versión del runtime;
- ayudarte a trabajar con una versión correcta de Ruby;
- evitar depender del Ruby del sistema.

Las dependencias del proyecto siguen perteneciendo al flujo de:

```bash
bin/setup local
```

En el estado actual del repo, ese paso queda listo para instalar futuras dependencias del `Gemfile` raíz cuando el playground las necesite.

---

## Cuándo tocar `mise.toml`

No deberías cambiarlo porque sí.

Conviene tocarlo cuando:

- el repo decide adoptar otra versión de Ruby;
- Docker cambia su imagen base y querés mantener alineación;
- hay una razón real de compatibilidad o mantenimiento.

## Regla práctica

Si cambiás `mise.toml`, también deberías revisar:

- `docker-compose.yml`
- `docs/COMO_EJECUTAR.md`
- `docs/ARQUITECTURA_DEL_PLAYGROUND.md`
- cualquier script que asuma una versión específica de Ruby.

---

## Relación con otros archivos

- `mise.toml` → declara la versión local de Ruby.
- `bin/pre-setup-local` → verifica e instala el runtime local.
- `bin/setup` → prepara dependencias del proyecto.
- `bin/run` → ejecuta ejemplos.

---

En resumen: `mise.toml` existe para que el playground no dependa del Ruby del sistema y para que el entorno local sea mucho más coherente con el runtime real que el proyecto quiere usar.
