import 'package:flutter/material.dart';

class EjerciciosGuardadosPage extends StatelessWidget {
  const EjerciciosGuardadosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicios Guardados")),
      body: const Center(child: Text("Aquí irán tus ejercicios guardados")),
    );
  }
}
