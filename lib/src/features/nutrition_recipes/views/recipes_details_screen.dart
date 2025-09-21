import 'package:flutter/material.dart';

class DetalleReceta extends StatelessWidget {
  const DetalleReceta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        children: [
          // Imagen de la receta
          SizedBox(
            height: 240,
            child: Image.asset(
              'assets/ensalada_frutas.jpg', // Reemplaza con tu imagen
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                const Text(
                  "Ensalada de Frutas",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Descripción
                const Text(
                  "Una ensalada fresca y nutritiva con mora, fresa, uvas, kiwi y naranja, apta para todo el mundo con un toque dulce después del entrenamiento.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                // Ingredientes
                const Text(
                  "Ingredientes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("- 1 naranja"),
                const Text("- 1/2 taza de moras"),
                const Text("- 1/2 taza de uvas"),
                const Text("- 1 kiwi"),
                const Text("- 1 cucharada de miel o sirope natural"),
                const SizedBox(height: 24),

                // Preparación
                const Text(
                  "Preparación",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("1. Lava bien todas las frutas"),
                const Text("2. Pela la naranja y el kiwi; corta en pedacitos"),
                const Text("3. Mezcla todas las frutas en un bowl"),
                const SizedBox(height: 32),

                // Botón Guardar Receta
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
