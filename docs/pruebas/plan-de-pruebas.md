## **4.1. Plan de Pruebas de Usabilidad**

### **4.1.1. Objetivo general**

Validar que el prototipo navegable de alta fidelidad de la app móvil de SiembraCo permite al cliente comprender el estado de su cultivo, las fechas de cosecha, las condiciones del producto y las alertas, reduciendo la necesidad de contactar a soporte y disminuyendo la intención de abandono de la siembra virtual.

### **4.1.2. Objetivos específicos**

1. Evaluar la claridad de la pantalla de inicio ("Tu cultivo") para identificar etapa actual, porcentaje de avance y fecha estimada de cosecha.  
2. Verificar que el usuario comprende el margen de variación de la cosecha y los motivos de reprogramación.  
3. Medir la facilidad para consultar la finca asignada, el agricultor aliado y los indicadores de buenas prácticas agrícolas (BPA).  
4. Validar la comprensión del simulador de compra anticipada y del plan SiembraCo Plus, sin que el usuario crea que está ejecutando una compra real.  
5. Comprobar que el usuario percibe el sello de "Información sanitaria validada por Legal SiembraCo · normativa INVIMA" como un elemento de confianza.  
6. Identificar problemas de usabilidad en los casos fuera del camino ideal: actualización pendiente (pantalla 02\) y cliente sin cultivo activo (pantalla 07).

### **4.1.3. Metodología**

* Tipo de prueba: Prueba de usabilidad moderada, presencial y remota, con tareas guiadas y think-aloud (pensamiento en voz alta).  
* Herramientas: Figma (prototipo navegable), Google Forms (cuestionario post-prueba), Excel (registro de métricas), Meet/Grabadora (sesiones remotas).  
* Duración por sesión: 30–40 minutos.  
* Participantes: 6 usuarios (5 clientes potenciales y 1 representante del área legal como observador experto).  
* Perfil de los participantes:  
  * 3 clientes actuales de SiembraCo (con al menos una siembra virtual activa).  
  * 2 clientes potenciales (personas que han comprado productos agrícolas online, pero no siembra virtual).  
  * 1 abogado o experto en regulación sanitaria alimentaria (valida comprensión de los textos legales).  
* Reclutamiento: A través de la red de contactos de los integrantes del equipo y del grupo de WhatsApp del proyecto, simulando el canal de la plataforma SiembraCo.

### **4.1.4. Tareas a evaluar (guion de prueba)**

| N° | Tarea | Historia(s) relacionada(s) | Criterio de éxito |
| :---- | :---- | :---- | :---- |
| 1 | Ingresa a la app con tu correo y contraseña. Activa la opción "Mantener la sesión en este teléfono". | RNF-01 | El usuario completa el inicio de sesión en menos de 1 minuto sin ayuda. |
| 2 | Desde la pantalla de inicio, dime en qué etapa está tu cultivo, qué porcentaje de avance tiene y cuándo será la cosecha estimada. | HU-01, HU-11 | El usuario identifica correctamente los tres datos. |
| 3 | Revisa si hay alguna alerta pendiente y dime qué debes hacer al respecto. | HU-03, HU-06 | El usuario encuentra la alerta y explica la acción sugerida. |
| 4 | Consulta la finca asignada y dime si tiene buenas prácticas agrícolas verificadas y quién es tu agricultor aliado. | HU-02, HU-08 | El usuario localiza la finca, el agricultor y el indicador BPA. |
| 5 | Simula qué pasaría si cambiaras tu compra de 3,0 kg a 5,0 kg y luego activa el plan SiembraCo Plus. ¿Qué te muestra la app? | HU-04, RNF-02 | El usuario entiende que es una simulación y no una compra real; identifica el nuevo total y el aviso de tarifas. |
| 6 | Busca el sello de información sanitaria validada por Legal y dime qué crees que significa. | HU-07 | El usuario reconoce el sello como respaldo legal y de confianza. |
| 7 | Imagina que tu agricultor no ha reportado esta semana. ¿Qué te muestra la app y qué harías? | HU-01 (CA-1.2), HU-14 | El usuario comprende que se muestra el último estado confirmado y que soporte ya fue notificado. |
| 8 | Supón que eres un cliente nuevo sin siembra activa. ¿Qué te muestra la app y cómo continuarías? | HU-01 (CA-1.3) | El usuario entiende el estado vacío y encuentra el enlace para comprar en [co.siembraco.com](https://co.siembraco.com/). |

### **4.1.5. Métricas de usabilidad**

| Métrica | Descripción | Meta |
| :---- | :---- | :---- |
| Tasa de éxito por tarea | % de usuarios que completan la tarea sin ayuda | ≥ 85% |
| Tiempo promedio por tarea | Segundos promedio para completar cada tarea | ≤ 90 segundos en tareas críticas |
| Errores por tarea | Número de errores o dudas expresadas por el usuario | ≤ 1 error por tarea |
| Satisfacción del usuario | Escala Likert 1–5 al finalizar la sesión | ≥ 4,0 |
| Comprensión del sello legal | % de usuarios que interpretan correctamente el sello | ≥ 90% |
| Intención de abandono | Pregunta post-prueba: "¿Contactarías a soporte antes de abandonar tu siembra?" | ≥ 80% responde que no |

### **4.1.6. Presupuesto asignado a la fase de pruebas**

* Horas hombre: 24 horas (4 horas por integrante, 3 integrantes).  
* Herramientas: \$0 COP (Figma y Google Forms en versión gratuita; Meet incluido en cuentas institucionales).  
* Infraestructura: \$0 COP (dispositivos propios de los participantes).  
* Contingencias: \$500.000 COP (para incentivos a participantes o imprevistos).  
* Total estimado: \$500.000 COP, dentro del presupuesto global de \$255.000.000 COP.

### **4.1.7. Cronograma de pruebas**

| Actividad | Fecha | Responsable |
| :---- | :---- | :---- |
| Preparación del guion y consentimientos | 20–22 oct 2026 | Líder de fase de Pruebas |
| Reclutamiento de participantes | 22–24 oct 2026 | Estudiante 3 – Relación con el Cliente |
| Ejecución de sesiones de prueba | 26–28 oct 2026 | Líder de fase de Pruebas \+ equipo |
| Análisis de resultados | 29–30 oct 2026 | Estudiante 2 – Seguimiento |
| Redacción del reporte | 31 oct – 1 nov 2026 | Líder de fase de Pruebas |
| Presentación de hallazgos | 2 nov 2026 | Todo el equipo |

### **4.1.8. Riesgos de la fase de pruebas**

| ID | Riesgo | Prob. | Impacto | Plan de contingencia |
| :---- | :---- | :---- | :---- | :---- |
| RP-01 | Baja disponibilidad de participantes | Media | Alto | Ampliar la red de contacto a estudiantes de otros semestres y usar incentivos. |
| RP-02 | El prototipo presenta fallos de navegación en Figma | Baja | Medio | Tener una versión en PDF con capturas de respaldo. |
| RP-03 | El representante legal no puede asistir | Media | Alto | Enviar el prototipo y el guion por correo para validación asíncrona. |
| RP-04 | Sesgo en las respuestas por conocer al equipo | Alta | Medio | Aplicar el cuestionario de forma anónima y no intervenir durante las tareas. |

