import 'package:flutter/material.dart';

import '../../core/router/app_rutas.dart';
import '../../core/theme/app_colores.dart';

/// Inicio de sesión con la misma cuenta de la plataforma (diagrama de actividad 1).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formulario = GlobalKey<FormState>();
  final _correo = TextEditingController();
  final _clave = TextEditingController();
  bool _mantenerSesion = true;
  bool _claveVisible = false;

  @override
  void dispose() {
    _correo.dispose();
    _clave.dispose();
    super.dispose();
  }

  void _ingresar() {
    if (!_formulario.currentState!.validate()) return;
    // La autenticación la resuelve la plataforma existente; en el prototipo se continúa directo.
    Navigator.of(context).pushReplacementNamed(AppRutas.principal);
  }

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
          child: Form(
            key: _formulario,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.eco, size: 48, color: AppColores.acento),
                const SizedBox(height: 12),
                Text(
                  'Tu cosecha, desde la finca hasta tu mesa',
                  style: texto.bodyMedium?.copyWith(color: AppColores.tintaSecundaria),
                ),
                const SizedBox(height: 32),
                Text('Hola de nuevo', style: texto.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text('Entra para ver en qué etapa va tu cultivo.', style: texto.bodyLarge),
                const SizedBox(height: 28),
                TextFormField(
                  controller: _correo,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Correo', prefixIcon: Icon(Icons.mail_outline)),
                  validator: (v) => (v == null || !v.contains('@')) ? 'Escribe un correo válido' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _clave,
                  obscureText: !_claveVisible,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_claveVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onPressed: () => setState(() => _claveVisible = !_claveVisible),
                    ),
                  ),
                  validator: (v) => (v == null || v.isEmpty) ? 'Escribe tu contraseña' : null,
                ),
                CheckboxListTile(
                  value: _mantenerSesion,
                  onChanged: (v) => setState(() => _mantenerSesion = v ?? false),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mantener la sesión en este teléfono'),
                ),
                const SizedBox(height: 8),
                FilledButton(onPressed: _ingresar, child: const Text('Ingresar')),
                TextButton(onPressed: () {}, child: const Text('¿Olvidaste tu contraseña?')),
                const SizedBox(height: 16),
                Text(
                  'Usa la misma cuenta de co.siembraco.com. No tienes que crear otra.',
                  textAlign: TextAlign.center,
                  style: texto.bodySmall?.copyWith(color: AppColores.tintaSecundaria),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
