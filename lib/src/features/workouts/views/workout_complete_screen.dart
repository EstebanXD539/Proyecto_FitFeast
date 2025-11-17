import 'package:flutter/material.dart';

class RutinaCompletada extends StatelessWidget {
  final Map<String, dynamic> ejercicio;

  const RutinaCompletada({super.key, required this.ejercicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ejercicio["descripcion"] ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Detalles
            const Text(
              "Detalles del ejercicio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Categoría: ${ejercicio["categoria"] ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Músculos: ${ejercicio["musculoObjetivo"] ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Dificultad: ${ejercicio["dificultad"] ?? "-"}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Duración: ${ejercicio["duracion"] ?? "-"} min",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Consejos
            const Text(
              "Consejos post-entrenamiento",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _consejoCuadro("Hidratación"),
            const SizedBox(height: 8),
            _consejoCuadro("Estiramientos"),
            const SizedBox(height: 8),
            _consejoCuadro("Resistencia"),
            const SizedBox(height: 32),

            // Botón volver
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Volver al inicio",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _consejoCuadro(String texto) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.star, color: Colors.black),
        ),
        const SizedBox(width: 12),
        Text(texto, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
