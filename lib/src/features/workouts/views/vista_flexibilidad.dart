import 'package:flutter/material.dart';

class VistaFlexibilidad extends StatelessWidget {
  const VistaFlexibilidad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexibilidad"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión de Flexibilidad",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Los ejercicios de flexibilidad reducen el riesgo de lesiones, mejoran la movilidad y ayudan a la recuperación muscular.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías iniciar una rutina de estiramientos
              },
              child: const Text("Iniciar sesión de flexibilidad"),
            ),
          ],
        ),
      ),
    );
  }
}
