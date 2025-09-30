import 'package:flutter/material.dart';

class PantallaDetalleReceta extends StatelessWidget {
  final Map<String, dynamic> receta;

  const PantallaDetalleReceta({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receta["titulo"] ?? "Receta")),
      backgroundColor: Colors.white,
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
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Ingredientes
          const Text(
            "Ingredientes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...List<Widget>.from(
            (receta["ingredientes"] as List<dynamic>? ?? []).map(
              (ing) => Text("• $ing"),
            ),
          ),
          const SizedBox(height: 24),

          // Preparación
          const Text(
            "Preparación",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...List<Widget>.from(
            (receta["preparacion"] as List<dynamic>? ?? []).map(
              (paso) => Text("• $paso"),
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
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                "Guardar Receta",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
