import 'package:flutter/material.dart';

class RutinaCompletada extends StatelessWidget {
  const RutinaCompletada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            // Ilustración decorativa
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/running_illustration.png', // Reemplaza con tu imagen
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),

            // Título y felicitación
            const Center(
              child: Column(
                children: [
                  Text(
                    "Rutina Completada",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("¡Felicidades, Luis!", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text(
                    "Has completado tu rutina de entrenamiento.\n¡Sigue así y alcanza tus metas!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Resumen del ejercicio
            const Text(
              "Resumen del ejercicio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "⏱️ Tiempo Total: 45 minutos",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "🔥 Calorías quemadas: 350 kcal",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Consejos post-entrenamiento con íconos en cuadrados grises
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

            // Botón volver al inicio
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // O navega a pantalla principal
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

  // Widget para consejo con ícono en cuadro gris
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
