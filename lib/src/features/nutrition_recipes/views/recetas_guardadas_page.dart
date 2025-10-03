import 'package:flutter/material.dart';

class RecetasGuardadasPage extends StatelessWidget {
  const RecetasGuardadasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recetas Guardadas")),
      body: const Center(child: Text("Aquí irán tus recetas favoritas")),
    );
  }
}
