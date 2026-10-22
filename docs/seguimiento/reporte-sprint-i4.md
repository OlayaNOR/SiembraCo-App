# Reporte del sprint I4 — Implementación, sprint 2

**Periodo:** 8 – 21 de octubre de 2026 · **Corte del Seguimiento 2:** jueves 22 de octubre · **Fase:** 3, Implementación · **Líder de la fase:** Nicolás Olaya
**Responsable del reporte:** frente de Seguimiento (Andrew García)

El 15 de octubre el cliente pidió presentar la implementación «hasta donde vaya la fase», con un corte en la semana del
seguimiento. El equipo tomó el corte el jueves 22, un día después del cierre planeado del sprint.

## 1. Indicadores

| Indicador | Fórmula | Al cierre del sprint (21-oct) | Al corte del seguimiento (22-oct) | Meta |
|---|---|---|---|---|
| Cumplimiento de sprint | puntos completados / puntos comprometidos | 3 / 8 = **37,5 %** ❌ | 8 / 8 = **100 %** al integrarse el PR #7 | ≥ 80 % |
| Desviación presupuestal | (real − planificado) / planificado | ($45.775.000 − $49.825.000) / $49.825.000 = **−8,1 %** | igual | ±10 % ✅ |

**Por qué no se cumplió al cierre:** HU-08 quedó sin responsable en el tablero después de integrar HU-12, y la sesión en
pareja que planeaba el taller del 8-oct no se agendó con fecha. El 19-oct se reasignó HU-08 a Andrew García, que la
terminó el 22-oct con su prueba (PR #7).

**Por qué el costo real es menor:** el prototipo en Figma no se ejecutó en I4. El cliente indicó el 15-oct que el
prototipo funcional se muestra en la implantación, así que esas horas de diseño UX/UI pasan a I6:

| Rol | Horas no ejecutadas | Tarifa | Monto |
|---|---|---|---|
| Diseñador UX/UI sénior | 25 | $85.000 | $2.125.000 |
| Diseñador UI júnior | 35 | $55.000 | $1.925.000 |
| | **60** | | **$4.050.000** |

No se activó la reserva de contingencia. El costo de I6 sube en esos $4.050.000 y el total del proyecto no cambia.

## 2. Historias comprometidas

| ID | Historia | Pts | Jira | Estado | Evidencia |
|---|---|---|---|---|---|
| HU-12 | Precio, unidades y condiciones de entrega con claridad | 3 | SCRUM-14 | Finalizado el 11-oct | PR #6: dos rondas de revisión, merge `ed5292e` |
| HU-08 | Indicadores de buenas prácticas agrícolas por finca | 5 | SCRUM-15 | Terminado el 22-oct, en revisión | PR #7: tarjeta BPA en Finca y su prueba de widget |
| | **Total** | **8** | | | |

Las Could (HU-14 y HU-15) no entraron: no sobró capacidad.

## 3. Tareas

| Tarea | Jira | Estado |
|---|---|---|
| Revisión de *pull requests* y de GUI | SCRUM-49 | Finalizado: PR #6 revisado con etiquetas `blocker`, `question`, `suggestion` y `nit` |
| Prototipo navegable en Figma | — | Reprogramado a I6 por indicación del cliente (15-oct) |
| Preparación del Seguimiento 2 | — | Finalizado: este reporte y [`seguimiento-2.md`](seguimiento-2.md) |

## 4. Riesgos

| Riesgo | Cambio en I4 | Mitigación |
|---|---|---|
| Historia comprometida sin responsable | **Ocurrió** con HU-08 y bajó el cumplimiento al cierre | Toda historia sale de la planeación con responsable y fecha; se revisa el tablero en la reunión del lunes |
| Revisión que bloquea la integración | Ocurrió en el PR #6: un `blocker` y la integración continua en rojo | Segunda ronda en menos de 24 horas; el revisor ya no sube commits al PR de otra persona (acuerdo 3 del taller) |
| R9 · Falla de sincronización con la plataforma | Sin cambios | `PlataformaEjemplo` sigue como respaldo |

## 5. Lecciones aprendidas

1. **Una historia sin dueño no avanza.** HU-08 quedó comprometida pero sin responsable y fue la que no se terminó.
2. **La pareja se agenda, no se supone.** El plan de pareja existía en el taller, pero sin fecha nunca ocurrió.
3. **La revisión en dos rondas funcionó.** El `blocker` del PR #6 se resolvió en un día y el PR entró con la integración continua en verde.

## 6. Para la iteración I5 — Pruebas

Líder: Valeria Alarcón. Plan y reporte de pruebas de usabilidad ([`pruebas/plan-de-pruebas.md`](../pruebas/plan-de-pruebas.md)),
con un usuario externo al equipo. Antes de las pruebas se integra el PR #7.
