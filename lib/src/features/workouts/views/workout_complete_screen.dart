import 'package:flutter/material.dart';

class RutinaCompletada extends StatelessWidget {
  final Map<String, dynamic> ejercicio;

  const RutinaCompletada({super.key, required this.ejercicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor, // 👈 respeta tema
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            // Imagen del ejercicio
            SizedBox(
              height: 200,
              child: Image.network(
                ejercicio["imagenUrl"] ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 24),

            // Nombre y descripción
            Center(
              child: Column(
                children: [
                  Text(
                    ejercicio["nombre"] ?? "Ejercicio",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ejercicio["descripcion"] ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Detalles
            Text(
              "Detalles del ejercicio",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Categoría: ${ejercicio["categoria"] ?? "-"}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Músculos: ${ejercicio["musculoObjetivo"] ?? "-"}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Dificultad: ${ejercicio["dificultad"] ?? "-"}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Duración: ${ejercicio["duracion"] ?? "-"} min",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Consejos
            Text(
              "Consejos post-entrenamiento",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            _consejoCuadro(context, "Hidratación"),
            const SizedBox(height: 8),
            _consejoCuadro(context, "Estiramientos"),
            const SizedBox(height: 8),
            _consejoCuadro(context, "Resistencia"),
            const SizedBox(height: 32),

            // Botón volver
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary, // 👈 usa color del tema
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  "Volver al inicio",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary, // 👈 contraste automático
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _consejoCuadro(BuildContext context, String texto) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondaryContainer, // 👈 respeta tema
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          texto,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
