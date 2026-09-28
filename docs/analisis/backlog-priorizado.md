# Backlog priorizado — SiembraCo

Responsable: frente de Seguimiento. Fuente: historias de usuario del documento de análisis, alcance (3.4) y restricciones (3.5) del caso.

## Criterio de priorización

El caso no pide "una app": pide **reducir la tasa de abandono de siembras virtuales antes de la cosecha**. El orden es:

1. Primero, lo que ataca una **causa declarada del abandono**: no entender el estado del cultivo, no saber la fecha de cosecha, no recibir alertas, confusión de precios y fechas.
2. Después, las **restricciones no negociables**: normativa INVIMA e integración obligatoria.
3. Después, lo que construye **confianza**: trazabilidad, origen, buenas prácticas.
4. Al final, lo **comercial**: simulaciones y planes.

## Escala MoSCoW

| Letra | Qué significa en este proyecto |
|---|---|
| Must | Sin esto el MVP no responde al problema, o es una restricción del cliente o del regulador |
| Should | Exigido por el alcance, pero el prototipo sigue siendo demostrable sin ello en la primera iteración |
| Could | Mejora propuesta por el equipo; entra solo si sobra capacidad |
| Won't | Fuera de este MVP, con justificación |

Ninguna funcionalidad del alcance (3.4) quedó en *Could*: son contractuales.

**Estimación:** puntos de historia en escala Fibonacci (1, 2, 3, 5, 8) por esfuerzo de diseño y prototipado navegable. Alimentan el indicador de cumplimiento de sprint.

## Must — 34 puntos

| ID | Historia | Origen | Pts | Criterio de aceptación |
|---|---|---|---|---|
| HU-01 | Como cliente, quiero ver un resumen del estado actual de mi cultivo, para saber en qué etapa va sin contactar a soporte | Alcance 3.4.1 | 8 | La pantalla de inicio muestra etapa actual, % de avance y fecha de última actualización |
| HU-11 | Como cliente, quiero ver la fecha estimada de cosecha y su margen, para planear la recepción | Alcance 3.4.3 | 5 | Fecha estimada + rango; si cambia, se indica la anterior y el motivo |
| HU-03 | Como cliente, quiero una notificación cuando mi cultivo cambie de etapa | Alcance 3.4.3 | 5 | Evento, texto y canal definidos; historial de alertas visible |
| HU-06 | Como cliente, quiero una notificación cuando mi producto esté cosechado y en camino | Alcance 3.4.6 | 5 | Alerta de cosecha y de despacho, con fecha estimada de entrega |
| HU-07 | Como área legal, quiero que la información sanitaria cumpla la normativa INVIMA | Restricción 3.5 | 5 | Listado de textos regulados y quién los validó; ninguna afirmación sanitaria sin respaldo |
| RNF-01 | La app se integra con la plataforma de siembra virtual existente; no duplica su información | Restricción 3.5 | 3 | Interfaz mínima documentada; al menos una pantalla evidencia el consumo |
| RNF-02 | La app no altera el modelo de precios ni los acuerdos con agricultores | Restricción 3.5 | 3 | Ninguna pantalla permite editar precio, plan ni condiciones |

HU-11 no estaba en el documento de análisis: el caso pide explícitamente mostrar fechas estimadas de cosecha y ninguna historia lo cubría.

## Should — 21 puntos

| ID | Historia | Origen | Pts | Criterio de aceptación |
|---|---|---|---|---|
| HU-02 | Como cliente, quiero consultar el detalle de la finca donde está mi siembra | Alcance 3.4.2 | 5 | Finca, ubicación, agricultor aliado y condiciones del cultivo |
| HU-12 | Como cliente, quiero ver con claridad precio, unidades y condiciones de entrega | Problema 3.2 | 3 | Una sola vista, sin cifras sin unidad ni fechas sin formato |
| HU-08 | Como calidad agrícola, quiero mostrar indicadores de buenas prácticas de cada finca | Stakeholder | 5 | Al menos un indicador BPA con su fecha de verificación |
| HU-05 | Como cliente, quiero información sobre origen y prácticas sostenibles | Alcance 3.4.5 | 3 | Mensajes educativos asociados a la etapa en curso |
| HU-04 | Como cliente, quiero simular más volumen, otra frecuencia o SiembraCo Plus | Alcance 3.4.4 | 5 | Muestra el resultado sin ejecutar la compra ni modificar precios |

## Could — 13 puntos (propuestas del equipo)

| ID | Historia | Pts |
|---|---|---|
| HU-13 | Línea de tiempo de las etapas ya superadas | 5 |
| HU-14 | Escalar una duda a soporte desde la pantalla del cultivo, con el contexto cargado | 3 |
| HU-15 | Comparar la cosecha estimada con ciclos anteriores | 5 |

## Won't (en este MVP)

| Ítem | Por qué queda fuera |
|---|---|
| HU-10 — el agricultor registra el avance | El alcance es la app del cliente; el avance se consume de la plataforma (RNF-01) |
| HU-09 — resolver dudas sin escribir a soporte | Es un resultado esperado, no una historia: pasa a indicador de éxito |
| Compra o pago dentro de la app | El proceso de compra ya funciona bien |
| Modificar precios o acuerdos | Prohibido por las restricciones (3.5) |
| Operación en Guatemala | Cambia normativa y alcance; pendiente de confirmar con el cliente |

## Reparto por iteración

| Iteración | Fechas | Contenido | Puntos |
|---|---|---|---|
| I3 — sprint 1 | 24 sep – 7 oct | Todos los Must | 34 |
| I4 — sprint 2 | 8 – 21 oct | Todos los Should + los Could que quepan | 21 (+13) |

Con 34 puntos comprometidos en I3, el mínimo para cumplir el indicador (80 %) es **28 puntos**.

## Resumen

| Prioridad | Ítems | Puntos | % |
|---|---|---|---|
| Must | 7 | 34 | 50 % |
| Should | 5 | 21 | 31 % |
| Could | 3 | 13 | 19 % |
| Won't | 5 | — | — |
| **Total activos** | **15** | **68** | |

## Dependencias

- **RNF-01** (integración) bloquea HU-01, HU-11, HU-03 y HU-06: sin el dato de la plataforma, esas pantallas no tienen qué mostrar. Es lo primero que hay que resolver en I3.
- **RNF-02** (no alterar precios) bloquea HU-04 y HU-12.
- Relacionadas: HU-07 con HU-08 y HU-05 (contenido regulado), HU-10 con RNF-01 (origen del dato), HU-13 con HU-01.

## En el tablero

El backlog está cargado en Jira bajo la épica `SCRUM-5`: cada ticket lleva su criterio de aceptación, los puntos y la prioridad MoSCoW (etiqueta y prioridad nativa: Must = Highest, Should = High, Could = Low, Won't = Lowest).

## Estado al cierre del diseño (27-sep)

| Fase | Estado |
|---|---|
| Análisis (stakeholders, historias, backlog, riesgos) | Finalizado |
| Diseño (arquitectura, diagramas de actividad, base de datos, mockups) | Finalizado; arquitectura y base de datos con ajustes menores pedidos en revisión |
| Historias del producto (`SCRUM-6` … `SCRUM-25`) | Por hacer: se construyen en el prototipo navegable desde I3 |

Ajuste pendiente: alinear el diagrama de actividad 4 (simulador) con HU-04 y RNF-02: el simulador no ejecuta la compra.
