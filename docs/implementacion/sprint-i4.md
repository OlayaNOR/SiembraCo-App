# Plan del sprint I4 (8 – 21 oct)

Segundo sprint de implementación. Cierra con el **Seguimiento 2** con el cliente (19–24 de octubre).
Aprobado en la reunión del equipo del 8 de octubre.

## Historias comprometidas

Las Should que no se adelantaron en I3. Se comprometen **8 puntos** (mínimo para el indicador: 7).

| Orden | ID | Ítem | Pts | Jira | Entregable |
|---|---|---|---|---|---|
| 1 | HU-12 | Precio, unidades y condiciones de entrega con claridad | 3 | SCRUM-14 | Precio por kilo y condiciones en una sola vista, sin cifras sin unidad |
| 2 | HU-08 | Indicadores de buenas prácticas agrícolas por finca | 5 | SCRUM-15 | Al menos un indicador BPA con su fecha de verificación |

HU-12 va primero porque reutiliza la tarjeta de la siembra de la pantalla Finca (RNF-02) y deja listo el formato
de moneda que usa el simulador.

**Si sobra capacidad (Could):** HU-14 (escalar una duda a soporte con el contexto cargado, 3 pts) y HU-15
(comparar la cosecha con ciclos anteriores, 5 pts).

## Tareas

| Tarea | Entregable |
|---|---|
| Prototipo navegable en **Figma** | Las nueve pantallas del prototipo HTML llevadas a Figma con su navegación completa; es el que se usa en las pruebas de usabilidad (I5) |
| Revisión de *pull requests* y de GUI (SCRUM-49) | Cada PR con al menos una aprobación y la integración continua en verde |
| Preparación del Seguimiento 2 | Avance técnico, indicadores de I3 e I4, presupuesto y riesgos |

## Forma de trabajo

- Ramas `feature/<id>-<descripcion>` desde `develop`, un PR por historia con la plantilla del repositorio.
- La integración continua (formato, análisis y pruebas) es obligatoria desde este sprint.
- Al cierre: cumplimiento de sprint y desviación presupuestal contra los $49.825.000 planificados para I4.
