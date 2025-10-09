import 'package:flutter/material.dart';

class VistaFuerza extends StatelessWidget {
  const VistaFuerza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fuerza"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Entrenamiento de Fuerza",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "El entrenamiento de fuerza ayuda a aumentar la masa muscular, mejorar la densidad ósea y acelerar el metabolismo.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Iniciar rutina de fuerza"),
            ),
          ],
        ),
      ),
    );
  }
}
