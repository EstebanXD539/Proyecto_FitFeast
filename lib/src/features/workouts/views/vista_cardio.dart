import 'package:flutter/material.dart';

class VistaCardio extends StatelessWidget {
  const VistaCardio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cardio"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión de Cardio",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "El cardio regular mejora la salud del corazón, aumenta la capacidad pulmonar "
              "y ayuda a mantener un peso saludable.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Iniciar sesión de cardio"),
            ),
          ],
        ),
      ),
    );
  }
}
