# Reporte del sprint I3 — Implementación, sprint 1

**Periodo:** 24 de septiembre – 7 de octubre de 2026 · **Fase:** 3, Implementación · **Líder de la fase:** Nicolás Olaya
**Responsable del reporte:** frente de Seguimiento · **Revisado en la reunión del equipo del 5 de octubre**

## 1. Indicadores

| Indicador | Fórmula | Resultado | Meta | Estado |
|---|---|---|---|---|
| Cumplimiento de sprint | puntos completados / puntos comprometidos | 34 / 34 = **100 %** | ≥ 80 % | ✅ Cumple |
| Desviación presupuestal | (real − planificado) / planificado | ($52.245.000 − $49.825.000) / $49.825.000 = **+4,9 %** | ±10 % | ✅ Dentro de la banda |

**Por qué el costo real supera al planificado:** la integración de solo lectura con la plataforma (RNF-01) tomó
15 horas más de arquitectura ($1.650.000) y 11 horas más de análisis ($770.000) de lo estimado, porque cuatro
historias dependían de ella. No se activó la reserva de contingencia.

## 2. Historias comprometidas

| ID | Historia | Pts | Jira | Estado | Evidencia |
|---|---|---|---|---|---|
| RNF-01 | Integración con la plataforma existente | 3 | SCRUM-11 | Finalizado | `data/plataforma/`, pruebas del repositorio |
| HU-01 | Resumen del estado del cultivo | 8 | SCRUM-6 | Finalizado | Pantalla de inicio |
| HU-11 | Fecha estimada de cosecha | 5 | SCRUM-7 | Finalizado | Tarjeta de cosecha con ventana y motivo |
| HU-03 | Alerta de cambio de etapa | 5 | SCRUM-8 | Finalizado | Prototipo 03 y 05 |
| HU-06 | Alerta de cosecha y envío | 5 | SCRUM-9 | Finalizado | Prototipo 04 |
| HU-07 | Textos sanitarios validados | 5 | SCRUM-10 | Finalizado | `SelloLegal` en toda información sanitaria |
| RNF-02 | No alterar precios ni acuerdos | 3 | SCRUM-12 | Finalizado | Pantalla Finca de solo lectura y su prueba (PR #4) |
| | **Total** | **34** | | **34 completados** | |

**Adelantado del sprint I4:** HU-02 (detalle de la finca, integrado con RNF-02 en el PR #4) y el avance del
simulador (HU-04), de los mensajes educativos (HU-05) y de la línea de tiempo (HU-13) en el prototipo.

## 3. Tareas de soporte

| Tarea | Jira | Estado |
|---|---|---|
| Repositorio estructurado y estándares de codificación | SCRUM-44 | Finalizado |
| Proyecto Flutter base: tema, navegación y modelos | SCRUM-45 | Finalizado |
| Prototipo previo en HTML a partir de los mockups | SCRUM-46 | Finalizado; el prototipo navegable se construye en **Figma** en I4 |
| Patrones de GUI documentados | SCRUM-47 | Finalizado (`docs/diseno/patrones-gui.md`) |
| Sesión de programación en pares | SCRUM-48 | Finalizado |
| Revisión de *pull requests* y de GUI | SCRUM-49 | Pasa a I4 |
| Este reporte | SCRUM-50 | Finalizado |

## 4. Riesgos

| Riesgo | Cambio en I3 | Mitigación |
|---|---|---|
| R9 · Falla de sincronización con la plataforma existente | Sube su probabilidad: RNF-01 bloqueaba cuatro historias | Datos de ejemplo de la plataforma (`PlataformaEjemplo`) y aviso ámbar de "actualización pendiente" (CA-1.2) |
| Choque de cambios en archivos compartidos | Ocurrió: el simulador y la pantalla Finca modificaron a la vez el contrato `PlataformaSiembraCo` | El cambio al contrato va primero en un PR pequeño; sincronización diaria con `develop` |

## 5. Lecciones aprendidas

1. **Primero el contrato, después las pantallas.** El choque del contrato con la plataforma costó una tarde de integración.
2. **Formato automático desde el inicio.** Se adoptó `dart format` y la integración continua a mitad del sprint; las primeras pantallas tuvieron que reformatearse.
3. **Ningún commit directo a `develop`.** Todo entra por rama y revisión, incluida la documentación.

## 6. Para el sprint I4

Historias Should pendientes (HU-12, HU-08), prototipo navegable en Figma, revisión de *pull requests* y preparación del
Seguimiento 2 (19–24 de octubre). Detalle en [`implementacion/sprint-i4.md`](../implementacion/sprint-i4.md).
