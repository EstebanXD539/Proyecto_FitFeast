import 'package:flutter/material.dart';

class HomeFitFeast extends StatelessWidget {
  const HomeFitFeast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Barra de navegación inferior
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

            // Indicador circular de progreso
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: CircularProgressIndicator(
                          value: 0.17, // 250/1500
                          strokeWidth: 12,
                          backgroundColor: Colors.grey.shade200,
                          color: Colors.green,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            "1,250 Restantes",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Objetivo base 1,500",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Recetas 650 • Ejercicio 400",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Sección Ejercicios
            const Text(
              "Ejercicios",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cardEjercicio("Trote", Icons.directions_run),
                _cardEjercicio("Ciclismo", Icons.directions_bike),
                _cardEjercicio("Pilates", Icons.self_improvement),
              ],
            ),
            const SizedBox(height: 32),

            // Sección Consejos
            const Text(
              "Consejos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cardConsejo("Fuerza", Icons.fitness_center),
                _cardConsejo("Cardio", Icons.favorite),
                _cardConsejo("Flexibilidad", Icons.accessibility_new),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget para tarjetas de ejercicio
  Widget _cardEjercicio(String titulo, IconData icono) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey.shade100,
          child: Icon(icono, size: 28, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(titulo, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Widget para tarjetas de consejo
  Widget _cardConsejo(String titulo, IconData icono) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icono, size: 28, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(titulo, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
