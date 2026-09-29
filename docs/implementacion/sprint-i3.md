# Plan del sprint I3 (24 sep – 7 oct)

Primer sprint de implementación. Se comprometen los **7 ítems Must** del backlog: **34 puntos** (mínimo para el indicador: 28).

| Orden | ID | Ítem | Pts | Entregable en el prototipo |
|---|---|---|---|---|
| 1 | RNF-01 | Integración con la plataforma existente | 3 | Interfaz mínima documentada; marca de origen del dato en cada pantalla |
| 2 | HU-01 | Resumen del estado del cultivo | 8 | Pantalla de inicio navegable |
| 3 | HU-11 | Fecha estimada de cosecha | 5 | Tarjeta de cosecha con rango y motivo de cambio |
| 4 | HU-03 | Alerta de cambio de etapa | 5 | Notificación push → detalle de la etapa |
| 5 | HU-06 | Alerta de cosecha y envío | 5 | Centro de alertas con historial |
| 6 | HU-07 | Textos sanitarios validados | 5 | Sello de validación legal en la información sanitaria |
| 7 | RNF-02 | No alterar precios ni acuerdos | 3 | Ninguna pantalla permite editarlos |

RNF-01 va primero porque bloquea cuatro de los siete ítems.

## Forma de trabajo

- Ramas `feature/<id>-<descripcion>` desde `develop`, un pull request por historia, revisado por otro integrante.
- Estándares en [`docs/estandares-codificacion.md`](../estandares-codificacion.md).
- Al cierre del sprint: cumplimiento de sprint y desviación presupuestal contra los $49.825.000 planificados para I3.
