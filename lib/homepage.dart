import 'package:app_fitfeast/src/features/auth_presentation/views/auth_service.dart';
import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final AuthService _authService = AuthService();

  int objetivo = 1500;
  int comida = 0;
  int ejercicio = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProgreso();
  }

  Future<void> _loadProgreso() async {
    final progreso = await _authService.getProgreso();
    if (progreso != null) {
      setState(() {
        objetivo = progreso["objetivo"];
        comida = progreso["comida"];
        ejercicio = progreso["ejercicio"];
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    int restantes = objetivo - (comida - ejercicio);
    if (restantes < 0) restantes = 0;
    double progreso = (objetivo - restantes) / objetivo;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                const SizedBox(height: 20),

                // Indicador circular
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: CircularProgressIndicator(
                              value: progreso,
                              strokeWidth: 14,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.green,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "$restantes",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Restantes",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "Objetivo base $objetivo",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Comida $comida • Ejercicio $ejercicio",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ------------------ SECCIÓN EJERCICIOS ------------------
                const Text(
                  "Ejercicios",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildExerciseCard("Trote", Icons.directions_run),
                      _buildExerciseCard("Ciclismo", Icons.pedal_bike),
                      _buildExerciseCard("Pilates", Icons.self_improvement),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ------------------ SECCIÓN CONSEJOS ------------------
                const Text(
                  "Consejos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    _buildTipCard(
                      "Fuerza",
                      Icons.fitness_center,
                      "Entrena 3 veces por semana",
                    ),
                    _buildTipCard(
                      "Cardio",
                      Icons.favorite,
                      "Haz al menos 30 min de cardio",
                    ),
                    _buildTipCard(
                      "Flexibilidad",
                      Icons.accessibility_new,
                      "Estira después de entrenar",
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  // Widget para tarjetas de ejercicios
  Widget _buildExerciseCard(String title, IconData icon) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Widget para tarjetas de consejos
  Widget _buildTipCard(String title, IconData icon, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
