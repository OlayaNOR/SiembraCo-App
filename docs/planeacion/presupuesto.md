# Presupuesto del proyecto

**Techo:** $255.000.000 COP · desviación máxima ±10 % · seguimiento financiero quincenal.

El caso no pide estimar cuánto costaría el proyecto: da una cifra cerrada y pide distribuirla. El modelo va de arriba abajo: la cifra está fija y lo que se estima es **cuánta capacidad compra**.

## 1 · Distribución por categoría

Las seis categorías son las que nombra la sección 3.6 del caso.

| # | Categoría | Monto | % |
|---|---|---|---|
| 1 | Horas hombre — análisis, arquitectura y asesoría regulatoria | $88.800.000 | 34,8 % |
| 2 | Diseño UX/UI | $63.850.000 | 25,0 % |
| 3 | Gestión del proyecto | $35.625.000 | 14,0 % |
| 4 | Validación de usabilidad | $23.000.000 | 9,0 % |
| 5 | Documentación | $22.900.000 | 9,0 % |
| 6 | Contingencias agrícolas y regulatorias | $20.825.000 | 8,2 % |
| | **Total** | **$255.000.000** | **100 %** |

Diseño UX/UI pesa una cuarta parte porque el entregable es un prototipo navegable, no un sistema en producción.

## 2 · Horas y tarifas

| Categoría | Rol | Tarifa/hora | Horas | Total |
|---|---|---|---|---|
| 1 · Horas hombre | Analista de negocio | $70.000 | 500 | $35.000.000 |
| | Arquitecto de software | $110.000 | 300 | $33.000.000 |
| | Asesor legal / regulatorio (INVIMA) | $130.000 | 160 | $20.800.000 |
| 2 · Diseño UX/UI | Diseñador UX/UI sénior | $85.000 | 460 | $39.100.000 |
| | Diseñador UI júnior | $55.000 | 450 | $24.750.000 |
| 3 · Gestión | Líder de proyecto | $95.000 | 375 | $35.625.000 |
| 4 · Usabilidad | Especialista en usabilidad | $75.000 | 240 | $18.000.000 |
| | Incentivos y logística de sesiones con usuarios | — | — | $5.000.000 |
| 5 · Documentación | Documentador técnico | $50.000 | 400 | $20.000.000 |
| | Herramientas (diseño, gestión, almacenamiento) × 3 meses | — | — | $2.900.000 |
| 6 · Contingencias | Reserva | — | — | $20.825.000 |
| | | | **2.885 h** | **$255.000.000** |

Tarifa promedio ponderada: $78.432/hora. Los roles son perfiles de costo, no integrantes: cada uno de los tres asume varios. La contingencia es la partida de cierre: lo que queda tras asignar las horas.

## 3 · Distribución por iteración

Necesaria para calcular el indicador de eficiencia, que compara el costo real con el planificado de cada quincena.

| Iteración | Fechas | Fase | Costo planificado | % | Banda −10 % | Banda +10 % |
|---|---|---|---|---|---|---|
| I1 | 27 ago – 9 sep | Análisis | $29.900.000 | 11,7 % | $26.910.000 | $32.890.000 |
| I2 | 10 – 23 sep | Diseño | $54.800.000 | 21,5 % | $49.320.000 | $60.280.000 |
| I3 | 24 sep – 7 oct | Implementación s1 | $49.825.000 | 19,5 % | $44.842.500 | $54.807.500 |
| I4 | 8 – 21 oct | Implementación s2 | $49.825.000 | 19,5 % | $44.842.500 | $54.807.500 |
| I5 | 22 oct – 4 nov | Pruebas | $29.900.000 | 11,7 % | $26.910.000 | $32.890.000 |
| I6 | 12 – 19 nov | Implantación | $19.925.000 | 7,8 % | $17.932.500 | $21.917.500 |
| Reserva | 5 – 11 nov | Contingencia | $20.825.000 | 8,2 % | — | — |
| | | **Total** | **$255.000.000** | **100 %** | | |

## 4 · Control

Desviación = (costo real − costo planificado) / costo planificado × 100, calculada al cierre de cada iteración.

| Umbral | Acción |
|---|---|
| Dentro de ±10 % | Se reporta y se sigue |
| Fuera de ±10 % | Se activa la reserva de contingencia y se documenta el motivo |
| Reserva agotada | Solicitud formal de ampliación, con análisis de impacto en tiempo y costo |

## 5 · Supuestos

1. Las tarifas son supuestos del equipo, calibradas a valores de mercado colombiano 2026, mientras no llegue la tabla de costos unitarios.
2. El reparto por categoría es decisión del equipo: el caso nombra las categorías pero no las pondera.
3. No incluye infraestructura de producción ni licencias de operación.
4. Alcance geográfico: solo Colombia.
5. Doce semanas de ejecución, del 27 de agosto al 19 de noviembre de 2026.
