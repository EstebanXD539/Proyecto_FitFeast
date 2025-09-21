import 'package:flutter/material.dart';

class RetoSemanal extends StatelessWidget {
  const RetoSemanal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Barra inferior
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Ejercicios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Recetas",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Retos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            // Título del reto
            const Text(
              "Reto Semanal: Desafío de Flexibilidad",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Descripción
            const Text(
              "Mejora tu flexibilidad con ejercicios diarios de estiramiento. Completa 5 sesiones esta semana y gana recompensas exclusivas.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Progreso
            const Text("Progreso 3/5", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.grey.shade300,
              color: Colors.green,
              minHeight: 10,
            ),
            const SizedBox(height: 32),

            // Tabla de clasificación
            const Text(
              "Tabla de Clasificación",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _rankingItem("🥇 Sofia Garcia", 120),
            const SizedBox(height: 8),
            _rankingItem("🥈 Carlos Lopez", 100),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget para ítem de ranking
  Widget _rankingItem(String nombre, int puntos) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nombre, style: const TextStyle(fontSize: 16)),
          Text(
            "$puntos pts",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
