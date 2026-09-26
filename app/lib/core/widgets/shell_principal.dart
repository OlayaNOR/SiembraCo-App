import 'package:flutter/material.dart';

import 'pantalla_en_construccion.dart';

/// Contenedor principal con la barra de pestañas de la app.
class ShellPrincipal extends StatefulWidget {
  const ShellPrincipal({super.key});

  @override
  State<ShellPrincipal> createState() => _ShellPrincipalState();
}

class _ShellPrincipalState extends State<ShellPrincipal> {
  int _indice = 0;

  static const _pestanas = [
    PantallaEnConstruccion(titulo: 'Inicio'),
    PantallaEnConstruccion(titulo: 'Etapas'),
    PantallaEnConstruccion(titulo: 'Alertas'),
    PantallaEnConstruccion(titulo: 'Finca'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: _indice, children: _pestanas)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.eco_outlined), selectedIcon: Icon(Icons.eco), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.timeline_outlined), selectedIcon: Icon(Icons.timeline), label: 'Etapas'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Alertas'),
          NavigationDestination(icon: Icon(Icons.agriculture_outlined), selectedIcon: Icon(Icons.agriculture), label: 'Finca'),
        ],
      ),
    );
  }
}
