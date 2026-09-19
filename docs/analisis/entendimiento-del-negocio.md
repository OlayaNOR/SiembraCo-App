# Entendimiento del negocio

## Proceso to-be: seguimiento del cultivo

![BPMN to-be](bpmn-to-be.png)

Ocho pasos en el camino feliz, dos excepciones y cinco carriles:

| Carril | Por qué está |
|---|---|
| Agricultor aliado | Origen del dato real de campo |
| Plataforma de siembra virtual | Sistema existente con el que la integración es obligatoria (RNF-01) |
| App SiembraCo | El MVP que se diseña |
| Cliente | Usuario final |
| Legal / Calidad | Interviene solo en la excepción normativa |

**Excepciones modeladas:**

1. **El agricultor no reporta en plazo:** la app muestra la última actualización válida y avisa a soporte, en vez de mostrar una etapa sin confirmar.
2. **Texto sanitario sin validar por legal:** se retira y se abre un incidente normativo. Regla: ninguna pantalla muestra una afirmación sanitaria sin respaldo legal.

## Objetivo medible

Reducir la tasa de abandono de siembras virtuales **del 40 % (línea base estimada) al 15 % en 6 meses** tras el lanzamiento del MVP, medido mensualmente sobre las siembras activas.

## Criterios de aceptación

### US-1 · Ver el resumen del estado del cultivo

| | |
|---|---|
| CA-1.1 | **Dado** que tengo un cultivo activo con avance reportado en las últimas 48 h, **cuando** abro la app, **entonces** el inicio muestra etapa actual, % de avance y fecha de última actualización. |
| CA-1.2 | **Dado** que el agricultor no ha reportado en más de 48 h, **cuando** abro la app, **entonces** veo la última actualización válida con su fecha y un aviso de actualización pendiente, y nunca una etapa sin confirmar. |
| CA-1.3 | **Dado** que no tengo cultivos activos, **cuando** abro la app, **entonces** veo un estado vacío que explica cómo adquirir una siembra virtual. |

### US-2 · Recibir notificación de cambio de etapa

| | |
|---|---|
| CA-2.1 | **Dado** que mi cultivo está en *Crecimiento* y tengo notificaciones activas, **cuando** la plataforma confirma el paso a *Cosecha programada*, **entonces** recibo una push en menos de 15 minutos con la nueva etapa y la fecha estimada. |
| CA-2.2 | **Dado** que el texto de la notificación tiene información sanitaria sin validar por legal, **entonces** no se envía y queda registrado como incidente normativo. |
| CA-2.3 | **Dado** que desactivé las notificaciones, **cuando** mi cultivo cambia de etapa, **entonces** no recibo push, pero el cambio queda en el historial de alertas. |

CA-1.2 y CA-2.2 corresponden a las dos excepciones del BPMN.
