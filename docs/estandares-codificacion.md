# Estándares de codificación — SiembraCo App

Reglas que sigue el equipo para escribir, versionar y revisar el código del proyecto:
la **app Flutter** (`app/`) y el **prototipo HTML** (`prototipo/`).
Aplican a todo lo que entre a `develop` y a `main`. Se revisan al cierre de cada iteración.

La versión completa, con ejemplos y justificación, está en el documento del equipo
*Estándares de codificación — SiembraCo* (Drive del proyecto). El flujo de trabajo con Git
está detallado en [`CONTRIBUTING.md`](../CONTRIBUTING.md).

## 1. Ramas

| Rama | Para qué | Quién integra |
|---|---|---|
| `main` | Versión publicada, la que se presenta al cliente en cada seguimiento | Solo por *pull request* desde `release/*` o `hotfix/*` |
| `develop` | Integración del trabajo de la iteración | Por *pull request* desde las ramas de trabajo |
| `feature/<id>-<descripcion>` | Una historia de usuario o pantalla (`feature/hu01-inicio`) | Quien revisa el PR |
| `fix/<descripcion>` | Corrección de un defecto encontrado en revisión o pruebas | Quien revisa el PR |
| `docs/<descripcion>` | Solo documentación | Cualquiera, con revisión |
| `release/x.y.z` | Cierre de versión al final de un sprint: solo entran correcciones | Líder de la fase |
| `hotfix/x.y.z` | Corrección urgente sobre `main`; vuelve también a `develop` | Líder de la fase |

- Nadie hace *commit* directo a `main` ni a `develop`.
- Una rama por historia; se borra después de integrarla.
- Antes de abrir el *pull request* se actualiza la rama con `develop` y se resuelven los conflictos localmente.

## 2. Mensajes de *commit*

Formato: `tipo(alcance): descripción en imperativo`, en español, en minúsculas y sin punto final.

| Tipo | Cuándo |
|---|---|
| `feat` | Pantalla, componente o navegación nueva |
| `fix` | Corrección |
| `test` | Pruebas nuevas o modificadas |
| `style` | Formato o cambio visual sin cambiar el comportamiento |
| `refactor` | Reorganizar código sin cambiar lo que se ve |
| `docs` | Documentación |
| `ci` | Integración continua |
| `chore` | Configuración del repositorio y dependencias |

Alcances habituales: `core`, `data`, `auth`, `inicio`, `etapas`, `alertas`, `finca`, `simulador`.

```
feat(inicio): fecha estimada de cosecha con su ventana (HU-11)
fix(simulador): corrige el redondeo de los valores en pesos
test(etapas): pruebas del cálculo de progreso por etapa
```

- El cuerpo del *commit* explica **por qué**, si no es obvio.
- Se referencia la historia del backlog (`HU-xx`, `RNF-xx`, `CA-x.x`) cuando aplique.
- **Programación en pares:** el *commit* lleva al final `Co-authored-by: Nombre <correo>` del compañero que trabajó en la sesión.

## 3. *Pull requests* y revisión

- Todo *pull request* usa la plantilla del repositorio y necesita **una aprobación** de otro integrante.
- La integración continua debe estar en verde: formato, análisis estático y pruebas.
- La descripción indica qué historia cubre, qué pantallas cambian y una captura del antes y el después.
- PR pequeños y de vida corta: como referencia, **menos de 400 líneas útiles** y máximo dos días abiertos.
- Quien revisa la GUI comprueba:
  - [ ] La pantalla corresponde al mockup aprobado y a su diagrama de actividad.
  - [ ] Usa los tokens del tema (`AppColores`, `AppTheme` o las variables de `styles.css`), sin colores ni tamaños sueltos.
  - [ ] La navegación lleva a la pantalla correcta.
  - [ ] Textos en español, sin errores, con el tono del resto de la app.
  - [ ] Contraste legible y zonas táctiles de al menos 48 px.

## 4. Dart y Flutter (`app/`)

**Herramientas obligatorias**

| Herramienta | Regla |
|---|---|
| `dart format` | Todo archivo se formatea antes del *commit* (ancho de línea 120, definido en `analysis_options.yaml`) |
| `flutter analyze` | Reglas de `flutter_lints` más las del proyecto; no entra código con avisos |
| `flutter test` | El conjunto completo pasa antes de integrar a `develop` |

**Estructura por funcionalidad**

```
lib/
├── core/       tema, navegación, widgets compartidos y utilidades (fechas, moneda)
├── data/       modelos, contrato con la plataforma y repositorios
└── features/   una carpeta por funcionalidad: auth, inicio, etapas, alertas, finca, simulador
test/           refleja la estructura de lib/
```

- Una *feature* no importa archivos internos de otra; si dos la necesitan, el componente sube a `core/`.
- Las pantallas nunca llaman directamente a la plataforma: pasan por un repositorio de `data/`.

**Nombres**

| Elemento | Regla | Ejemplo |
|---|---|---|
| Archivos y carpetas | `snake_case`, sin tildes ni espacios | `repositorio_cultivo.dart` |
| Clases y enums | `UpperCamelCase` | `EtapaCultivo` |
| Variables, métodos y parámetros | `lowerCamelCase`, descriptivos | `fechaEstimadaCosecha` |
| Miembros privados | Prefijo `_` | `_cargar()` |
| Pantallas | Sufijo `Screen` | `InicioScreen`, `FincaScreen` |
| Pruebas | Nombre del archivo probado + `_test` | `repositorio_cultivo_test.dart` |

- Los nombres del dominio van en español (cultivo, etapa, finca, alerta, siembra); los del *framework*, en inglés.
- Booleanos como pregunta: `estaActivo`, `tieneAlertasPendientes`.

**Reglas de negocio que se verifican en el código**

1. La app **solo lee** de la plataforma de siembra virtual (RNF-01) y nunca permite editar precio, plan ni condiciones (RNF-02). Cada pantalla con datos comerciales tiene una prueba que lo comprueba.
2. Toda información sanitaria se muestra con el `SelloLegal` (HU-07, normativa INVIMA).
3. Valores en pesos colombianos con punto de miles y unidad (`$ 168.000 COP`); fechas en español.
4. Toda historia trae su prueba; un defecto corregido trae la prueba que lo reproduce.
5. Sin credenciales, datos reales de personas ni archivos de compilación en el repositorio.

## 5. HTML y CSS (`prototipo/`)

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

## 6. Datos de ejemplo

- Los datos son **estáticos y de ejemplo** (la clienta Camila, el cultivo de tomate cherry, Ernesto como agricultor y la Finca La Esperanza).
- No se guardan datos reales de personas ni credenciales.

## 7. Adopción gradual

| Cuándo | Qué se exige |
|---|---|
| Sprint I3, semana 2 | Formato automático y `.editorconfig` |
| Sprint I4 | Integración continua obligatoria en cada PR y reglas de manejo de errores |
| Desde las pruebas (I5) | Revisión de cobertura de los criterios de aceptación |

Para el código que ya existía se aplica la regla del *boy scout*: cada archivo que se toca queda un poco mejor de lo que estaba.
