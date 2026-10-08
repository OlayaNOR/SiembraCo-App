# Patrones de GUI — SiembraCo App

Sistema visual que comparten las nueve pantallas del prototipo y que la app Flutter replica en su tema.
Es la descripción del patrón ya implementado (`prototipo/styles.css` y `app/lib/core/theme/`), no una propuesta.
El documento completo, con muestras de color y el set de íconos, está en el Drive del proyecto (*Patrones de GUI — SiembraCo*).

## 1. Color

Proporción **60/30/10**: 60 % fondo y tarjetas, 30 % tinta de texto, 10 % acento.

| Token CSS | En Flutter | Valor | Uso |
|---|---|---|---|
| `--bg` | `AppColores.fondo` | `#F4F6F1` | Fondo de toda pantalla |
| `--card` | `AppColores.tarjeta` | `#FFFFFF` | Tarjetas y componentes elevados |
| `--ink` / `--ink-70` / `--ink-50` | `AppColores.tinta`, `tintaSecundaria` | Verde-negro en 3 opacidades | Texto principal, secundario y terciario |
| `--accent` / `--accent-ink` | `AppColores.acento`, `acentoOscuro` | `#2E7D4F` / `#1F5A38` | Único color de acción: botones, anillos, estados activos |
| `--warn` / `--warn-bg` | `AppColores.aviso`, `avisoFondo` | `#8A5810` / `#FBF1DC` | Solo "actualización pendiente"; nunca error |
| `--azul` | `AppColores.azul` | `#3D5A80` | Reservado para datos de clima |

> **El rojo no se usa en ninguna pantalla.** Un cultivo sin reporte reciente es una espera, no un error: por eso la alerta siempre es ámbar.

## 2. Tipografía

- Una sola familia, **Inter**, incluida localmente para que el render sea reproducible.
- Jerarquía por tamaño: 22 px títulos · 15 px texto base · 13 px etiquetas · 11–12 px texto decorativo.
- Dos pesos: 600 para énfasis y 400 para lectura.
- Cifras tabulares (`tabular-nums`) en precios, porcentajes y fechas.

## 3. Componentes reutilizables

| Componente | Dónde aparece | Qué resuelve |
|---|---|---|
| Tarjeta (`.card`) | Todas las pantallas | Contenedor base: fondo blanco, radio 20 px, sombra suave |
| Chip (`.chip`) | Estados y categorías | Etiqueta redondeada; variantes neutra y sobre imagen |
| Botones (`.boton-pri`, `.boton-sec`) | Toda acción principal | Altura mínima 52 px, en la zona del pulgar |
| Anillo de avance | Inicio | Progreso del ciclo; variante gris cuando el dato está desactualizado |
| Sello legal (`.sello`, `SelloLegal`) | Información sanitaria | Borde punteado e ícono de validación (HU-07) |
| Aviso (`.aviso`) | Actualización pendiente | Fondo ámbar: comunica espera, no error |
| Línea de tiempo (`.paso`) | Etapas | Estados hecho / activo / futuro |
| Alerta (`.alerta`) | Alertas | Notificación; variante nueva con borde de acento |
| Barra de pestañas (`.tabbar`, `ShellPrincipal`) | Todas excepto login y push | Cuatro pestañas fijas |
| Interruptor (`.toggle`) | Preferencias | Mismo verde de acento al activarse |

## 4. Procedencia del dato

Toda información que viene de la plataforma existente declara en pantalla **de dónde viene y cuándo se actualizó**:
*"Actualizado hoy 7:40 · plataforma SiembraCo"*. Es la forma visible de cumplir la integración de solo lectura (RNF-01).

## 5. Accesibilidad

- Texto secundario con contraste de al menos 5,4:1 sobre fondo y tarjeta.
- Zonas táctiles de 44 px o más (los botones principales, 52 px).
- El estado nunca depende solo del color: siempre lleva ícono y texto.

## 6. Espaciado

| Propiedad | Valor |
|---|---|
| Radio de tarjeta / de chip | 20 px / 12 px |
| Padding interno de tarjeta | 16 px |
| Margen de pantalla | 20 px laterales, 16 px superior |
| Separación entre tarjetas | 10 px |
| Barra de estado / de pestañas | 54 px / 84 px |

## 7. Iconografía e imágenes

- Íconos de trazo (*outline*) sobre rejilla de 24 × 24, trazo de 1,8 px con extremos redondeados; heredan el color del texto (`currentColor`).
- Fotografía documental con luz natural y presencia humana (manos, agricultor); ilustraciones planas en la paleta verde.
- Ningún texto sobre foto sin velo de oscurecimiento.

## 8. Estados de la interfaz

| Estado | Tratamiento |
|---|---|
| Vacío | Ilustración, mensaje explicativo y botón hacia la plataforma de compra |
| Dato pendiente | Franja ámbar y anillo gris con el último dato confirmado |
| Cargando *(propuesto)* | Anillo gris sin número y siluetas de tarjeta, sin colores nuevos |
| Error de conexión *(propuesto)* | Mismo aviso ámbar con botón "Reintentar" (riesgo R9) |

## 9. Voz y tono

- Cercano y con nombres propios: *"Buenos días, Camila"*, *"Ernesto, tu agricultor"*.
- Transparente sobre lo que la app ya hizo: *"Ya avisamos a Ernesto y a soporte agrícola."*
- Preciso con fechas y motivos: todo cambio dice el antes, el después y el porqué.
- Nunca alarmista: "actualización pendiente", no "fallo".
