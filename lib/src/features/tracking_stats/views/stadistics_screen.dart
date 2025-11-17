import 'package:flutter/material.dart';

class EstadisticasFitness extends StatelessWidget {
  const EstadisticasFitness({super.key});

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

            // Selector de tiempo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _filtroTiempo("Semana", true),
                _filtroTiempo("Mes", false),
                _filtroTiempo("Año", false),
              ],
            ),
            const SizedBox(height: 24),

            // Métricas de actividad
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _cardEstadistica("Días Activos", "5"),
                _cardEstadistica("Ejercicios Realizados", "150"),
              ],
            ),
            const SizedBox(height: 32),

            // Gráfico de calorías (simulado)
            const Text(
              "Calorías Quemadas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                "📈 Gráfico de calorías (23 Nov - Domingo)",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),

            // Evolución del peso
            const Text(
              "Evolución del Peso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "75 kg",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Este Mes -2%",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget para selector de tiempo
  Widget _filtroTiempo(String label, bool activo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: activo ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: activo ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }

  // Widget para métrica de actividad
  Widget _cardEstadistica(String titulo, String valor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              valor,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              titulo,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
