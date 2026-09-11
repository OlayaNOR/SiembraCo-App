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
