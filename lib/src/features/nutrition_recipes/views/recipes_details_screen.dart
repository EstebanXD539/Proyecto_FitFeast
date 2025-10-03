import 'package:flutter/material.dart';

class PantallaDetalleReceta extends StatelessWidget {
  final Map<String, dynamic> receta;

  const PantallaDetalleReceta({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receta["titulo"] ?? "Receta")),
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor, // 👈 respeta tema
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (receta["imagenUrl"] != null)
            Image.network(
              receta["imagenUrl"],
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
          const SizedBox(height: 16),

          // Descripción
          Text(
            receta["descripcion"] ?? "",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Ingredientes
          Text(
            "Ingredientes",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ...List<Widget>.from(
            (receta["ingredientes"] as List<dynamic>? ?? []).map(
              (ing) =>
                  Text("• $ing", style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
          const SizedBox(height: 24),

          // Preparación
          Text(
            "Preparación",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          ...List<Widget>.from(
            (receta["preparacion"] as List<dynamic>? ?? []).map(
              (paso) => Text(
                "• $paso",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Botón Guardar
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Receta guardada en favoritos")),
                );
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
                "Guardar Receta",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary, // 👈 contraste automático
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
