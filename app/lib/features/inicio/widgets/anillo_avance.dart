import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colores.dart';

/// Anillo con el porcentaje de avance del ciclo del cultivo.
class AnilloAvance extends StatelessWidget {
  const AnilloAvance({super.key, required this.avance, this.tamano = 96});

  final double avance;
  final double tamano;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: tamano,
      child: CustomPaint(
        painter: _PintorAnillo(avance.clamp(0, 1)),
        child: Center(
          child: Text('${(avance * 100).round()} %', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}

class _PintorAnillo extends CustomPainter {
  _PintorAnillo(this.avance);

  final double avance;

  @override
  void paint(Canvas canvas, Size size) {
    const grosor = 9.0;
    final rect = Offset.zero & size;
    final area = rect.deflate(grosor / 2);
    final fondo = Paint()
      ..color = AppColores.acentoSuave
      ..style = PaintingStyle.stroke
      ..strokeWidth = grosor;
    final progreso = Paint()
      ..color = AppColores.acento
      ..style = PaintingStyle.stroke
      ..strokeWidth = grosor
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(area, 0, 2 * math.pi, false, fondo);
    canvas.drawArc(area, -math.pi / 2, 2 * math.pi * avance, false, progreso);
  }

  @override
  bool shouldRepaint(_PintorAnillo old) => old.avance != avance;
}
