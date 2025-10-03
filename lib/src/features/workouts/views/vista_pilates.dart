import 'package:flutter/material.dart';

class VistaPilates extends StatelessWidget {
  const VistaPilates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilates"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión de Pilates",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "El pilates mejora la postura, la flexibilidad y fortalece el core con ejercicios de bajo impacto.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías iniciar una rutina de pilates
              },
              child: const Text("Iniciar sesión de pilates"),
            ),
          ],
        ),
      ),
    );
  }
}
