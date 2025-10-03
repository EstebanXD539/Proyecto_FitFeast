import 'package:flutter/material.dart';

class HistorialEjerciciosPage extends StatelessWidget {
  const HistorialEjerciciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulación de historial
    final List<Map<String, dynamic>> historial = [
      {"nombre": "Trote", "duracion": 30, "fecha": "2025-09-28"},
      {"nombre": "Ciclismo", "duracion": 45, "fecha": "2025-09-27"},
      {"nombre": "Pilates", "duracion": 20, "fecha": "2025-09-26"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Historial de Ejercicios")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: historial.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final ejercicio = historial[index];
          return ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text(ejercicio["nombre"]),
            subtitle: Text("Duración: ${ejercicio["duracion"]} min"),
            trailing: Text(ejercicio["fecha"]),
          );
        },
      ),
    );
  }
}
