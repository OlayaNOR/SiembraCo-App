# Prototipo navegable — SiembraCo App

Las pantallas de la app móvil en HTML y CSS, a partir de los mockups aprobados en la fase de diseño.
Se abren directamente en el navegador (ancho de referencia: 390 px) y no requieren servidor.

## Pantallas

| Archivo | Pantalla | Backlog que cubre |
|---|---|---|
| `09-login.html` | Iniciar sesión | RNF-01 · diagrama de actividad 1 |
| `01-inicio.html` | Inicio · tu cultivo | HU-01 · HU-11 · HU-07 · RNF-01 |
| `02-inicio-pendiente.html` | Inicio · actualización pendiente | Excepción 1 del BPMN (el agricultor no reporta a tiempo) |
| `03-etapas.html` | Etapas del cultivo | HU-11 · HU-05 · RNF-01 |
| `04-alertas.html` | Centro de alertas | HU-03 · HU-06 |
| `05-push.html` | Notificación push | HU-03 · HU-06 |
| `06-finca.html` | Finca asignada y trazabilidad | HU-02 · HU-12 · HU-08 · HU-07 · RNF-02 |
| `07-vacio.html` | Sin siembra activa | RNF-01 |
| `08-simular.html` | Simular mi siembra (SiembraCo Plus) | HU-04 · RNF-01 · RNF-02 |

## Estructura

```
prototipo/
├── 01-inicio.html … 09-login.html   una pantalla por archivo
├── styles.css                        tokens y componentes compartidos
├── img/                              fotos e ilustraciones
└── fonts/inter.woff2                 tipografía local
```

Las reglas para agregar o modificar pantallas están en [`docs/estandares-codificacion.md`](../docs/estandares-codificacion.md).

## Estado

- [x] Pantallas base importadas desde los mockups de la fase de diseño
- [ ] Navegación entre pantallas (login → inicio, barra de pestañas, alertas → detalle)
- [ ] Vistas por rol
- [ ] Revisión de GUI de cada flujo por *pull request*
