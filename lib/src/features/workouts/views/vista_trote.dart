import 'package:flutter/material.dart';

class VistaTrote extends StatelessWidget {
  const VistaTrote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trote"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión de Trote",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "El trote es un excelente ejercicio cardiovascular que ayuda a mejorar la resistencia, "
              "quemar calorías y fortalecer el sistema respiratorio.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Iniciar sesión de trote"),
            ),
          ],
        ),
      ),
    );
  }
}
