# Cómo contribuir — SiembraCo App

Guía del flujo de trabajo del equipo. Las reglas de estilo del código están en
[`docs/estandares-codificacion.md`](docs/estandares-codificacion.md).

## Antes de empezar

1. Pide acceso al repositorio, al tablero de Jira (proyecto `SCRUM`) y al canal del equipo.
2. Configura Git con tu nombre y correo reales:
   ```
   git config user.name "Nombre Apellido"
   git config user.email "correo@ejemplo.com"
   ```
3. Clona el repositorio y ubícate en `develop`. Revisa el historial y los *pull requests* anteriores para ver cómo trabaja el equipo.
4. Para la app: instala Flutter (canal estable) y corre `flutter pub get` y `flutter test` dentro de `app/`.

## Ciclo de una tarea

```
Jira (SCRUM-xx) → rama desde develop → commits → pull request → revisión + CI → merge a develop → tarea Finalizada
```

1. **Toma la tarea en Jira** y muévela a *En curso*.
2. **Crea la rama** desde `develop` actualizada:
   ```
   git switch develop && git pull
   git switch -c feature/hu12-precio-claro
   ```
3. **Haz commits pequeños** con el formato `tipo(alcance): descripción (HU-xx)`.
4. **Sincroniza a diario** si la rama sigue abierta: `git fetch` y `git merge origin/develop`. Los conflictos se resuelven en tu rama, nunca en `develop`.
5. **Abre el pull request** hacia `develop` con la plantilla: historia que cubre, pantallas que cambian, capturas y checklist.
6. **Revisión:** otro integrante revisa y aprueba. La integración continua debe quedar en verde.
7. **Integra** con *merge commit* (`--no-ff`), borra la rama y mueve la tarea a *Finalizado* en Jira.

## Resolver un conflicto

1. Entiende los dos cambios: qué quería cada uno.
2. Edita los marcadores con criterio de negocio y del estándar, no "quedándote con lo tuyo".
3. Corre `flutter analyze` y `flutter test`.
4. Termina el merge, sube la rama y avisa en el canal del equipo.

Si dos personas van a tocar el mismo archivo compartido (por ejemplo, el contrato `PlataformaSiembraCo`),
el cambio al contrato va primero en un PR pequeño y separado; las dos ramas parten de ahí.

## Versiones

Versionado semántico `MAYOR.MENOR.PARCHE`:

| Cambio | Ejemplo |
|---|---|
| **Mayor** — incompatible con la versión anterior (p. ej., cambia el contrato con la plataforma) | `1.0.0 → 2.0.0` |
| **Menor** — funcionalidad nueva compatible | `0.1.0 → 0.2.0` |
| **Parche** — corrección | `0.2.0 → 0.2.1` |

**Release:** al cierre de cada sprint se crea `release/x.y.z` desde `develop` → solo entran correcciones →
PR a `main` → *tag* `vx.y.z` → la rama de release vuelve a `develop`. Las notas van en [`CHANGELOG.md`](CHANGELOG.md).

**Hotfix:** un defecto en `main` se corrige en `hotfix/x.y.z` creada desde `main`, con la prueba que lo reproduce.
Va por PR a `main` y también a `develop`.

## Lo que no se hace

- Push directo o `push --force` a `main` o `develop`.
- Integrar un PR propio sin revisión.
- Commits gigantes que mezclan varias historias.
- Subir credenciales, `.env`, datos reales de personas o carpetas de compilación (`build/`, `.dart_tool/`).
