import 'package:flutter/material.dart';

class VistaCiclismo extends StatelessWidget {
  const VistaCiclismo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ciclismo"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sesión de Ciclismo",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "El ciclismo fortalece las piernas, mejora la resistencia y es ideal para entrenamientos de bajo impacto.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Iniciar sesión de ciclismo"),
            ),
          ],
        ),
      ),
    );
  }
}
