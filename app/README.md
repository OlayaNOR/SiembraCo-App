# SiembraCo App — Flutter

App móvil para Android e iOS que muestra al cliente el estado de su siembra virtual: etapa del cultivo, fecha estimada de cosecha, alertas y trazabilidad de la finca.

## Estructura

```
lib/
├── main.dart
├── app.dart                  configuración de la app y rutas
├── core/                     tema, navegación, widgets y utilidades compartidas
├── data/
│   ├── models/               entidades del dominio
│   ├── plataforma/           acceso de solo lectura a la plataforma de siembra virtual
│   └── repositorios/         lógica de acceso que usan las pantallas
└── features/                 una carpeta por funcionalidad (auth, inicio, etapas, alertas, finca, simulador)
```

## Cómo ejecutarla

```
flutter pub get
flutter run
```

Los datos vienen de `PlataformaEjemplo`, que reproduce la respuesta de la plataforma existente mientras la integración se simula.

## Avance del sprint I3

- [x] Tema y colores de la marca
- [x] Navegación con barra de pestañas
- [x] Modelos de datos
- [x] Fuente de datos de la plataforma de siembra virtual (solo lectura, RNF-01)
- [x] Inicio de sesión
- [x] Inicio: resumen del cultivo (HU-01)
- [x] Inicio: fecha estimada de cosecha (HU-11)
- [x] Sello de validación legal (HU-07)
- [ ] Inicio: actualización pendiente (CA-1.2)
