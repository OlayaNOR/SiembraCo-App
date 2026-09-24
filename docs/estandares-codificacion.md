# Estándares de codificación — SiembraCo App

Reglas que sigue el equipo para escribir, versionar y revisar el código del prototipo navegable.
Aplican a todo lo que entre a `develop` y a `main`.

## 1. Ramas

| Rama | Para qué | Quién integra |
|---|---|---|
| `main` | Versión estable, la que se presenta al cliente en cada seguimiento | Solo por *pull request* desde `develop`, con aprobación del líder de la fase |
| `develop` | Integración del trabajo de la iteración | Por *pull request* desde las ramas de trabajo |
| `feature/<id>-<descripcion>` | Una historia de usuario o pantalla (`feature/hu01-inicio`) | Quien la desarrolla |
| `fix/<descripcion>` | Corrección de un defecto encontrado en revisión o pruebas | Quien lo corrige |
| `docs/<descripcion>` | Solo documentación | Cualquiera |

- Nadie hace *commit* directo a `main` ni a `develop`.
- Una rama por historia; se borra después de integrarla.
- Antes de abrir el *pull request* se actualiza la rama con `develop` y se resuelven los conflictos localmente.

## 2. Mensajes de *commit*

Formato: `tipo(alcance): descripción en imperativo`, en español y sin punto final.

| Tipo | Cuándo |
|---|---|
| `feat` | Pantalla, componente o navegación nueva |
| `fix` | Corrección |
| `style` | Cambio visual sin cambiar estructura (colores, espaciados) |
| `refactor` | Reorganizar código sin cambiar lo que se ve |
| `docs` | Documentación |
| `chore` | Configuración del repositorio |

Ejemplos:

```
feat(inicio): agregar tarjeta de fecha estimada de cosecha (HU-02)
fix(alertas): corregir contraste del texto en alertas leídas
docs: documentar patrones de GUI de tarjetas y pestañas
```

- El cuerpo del *commit* explica **por qué**, si no es obvio.
- Se referencia la historia del backlog (`HU-xx`, `RNF-xx`) cuando aplique.
- **Programación en pares:** el *commit* lleva al final `Co-authored-by: Nombre <correo>` del compañero que trabajó en la sesión.

## 3. *Pull requests* y revisión de GUI

- Todo *pull request* necesita **una aprobación** de otro integrante antes de integrarse.
- La descripción indica qué historia cubre, qué pantallas cambian y una captura del antes y el después.
- Quien revisa la GUI comprueba:
  - [ ] La pantalla corresponde al mockup aprobado y a su diagrama de actividad.
  - [ ] Usa los componentes y tokens de `styles.css` (no colores ni tamaños sueltos en el HTML).
  - [ ] Los enlaces de navegación llevan a la pantalla correcta.
  - [ ] Textos en español, sin errores, con el tono del resto de la app.
  - [ ] Contraste legible y objetivos táctiles de al menos 44 px.

## 4. HTML y CSS

**Estructura**
- Una pantalla por archivo, con prefijo numérico y nombre en minúsculas con guiones: `01-inicio.html`, `08-simular.html`.
- Cada pantalla sigue el mismo esqueleto: `.pantalla` → `.statusbar` → `main.scroll` → `.tabbar` → `.home-indicator`.
- `lang="es"`, `charset="utf-8"` y `viewport` de 390 px (el tamaño del dispositivo de referencia).
- Toda imagen lleva `alt` descriptivo.

**Nombres de clases**
- En **español**, minúsculas y con guiones: `.paso-titulo`, `.alerta-cuerpo`, `.logo-row`.
- Los modificadores de estado son clases cortas: `.activa`, `.on`, `.atenuada`, `.sel`.

**Estilos**
- Todo el estilo vive en `styles.css`; no se usa `style="…"` en línea salvo para valores calculados.
- Los colores y medidas se toman de las variables de `:root` (tokens), no se escriben a mano.
- Indentación de 2 espacios y codificación UTF-8.

**Recursos**
- Imágenes en `img/` (JPG para fotos, PNG para ilustraciones), fuentes en `fonts/`.
- Rutas siempre relativas, para que la carpeta se abra tal cual en cualquier navegador.
- Íconos como SVG en línea, con `stroke="currentColor"` para heredar el color.

## 5. Datos del prototipo

- Los datos son **estáticos y de ejemplo** (la clienta Camila, el cultivo de tomate cherry, Ernesto como agricultor y la Finca La Esperanza).
- No se guardan datos reales de personas ni credenciales.
- La información sanitaria mostrada lleva siempre el sello de validación legal, como exige el backlog (RNF de normativa INVIMA).
