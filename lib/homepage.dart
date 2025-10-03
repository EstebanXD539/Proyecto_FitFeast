// pantallainicio_actualizado.dart
import 'package:app_fitfeast/src/features/workouts/views/vista_cardio.dart';
import 'package:app_fitfeast/src/features/workouts/views/vista_ciclismo.dart';
import 'package:app_fitfeast/src/features/workouts/views/vista_flexibilidad.dart';
import 'package:app_fitfeast/src/features/workouts/views/vista_fuerza.dart';
import 'package:app_fitfeast/src/features/workouts/views/vista_pilates.dart';
import 'package:app_fitfeast/src/features/workouts/views/vista_trote.dart';
import 'package:flutter/material.dart';
import 'package:app_fitfeast/src/core/services/auth_service.dart';
import 'package:app_fitfeast/src/features/workouts/views/progreso_diario_widget.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                const SizedBox(height: 20),

                // Indicador circular modularizado
                Center(
                  child: ProgresoDiarioWidget(
                    objetivo: objetivo,
                    comida: comida,
                    ejercicio: ejercicio,
                  ),
                ),

                const SizedBox(height: 32),

                // ------------------ SECCIÓN EJERCICIOS ------------------
                Text(
                  "Ejercicios",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildExerciseCard(
                        context,
                        "Trote",
                        Icons.directions_run,
                        const VistaTrote(),
                      ),
                      _buildExerciseCard(
                        context,
                        "Ciclismo",
                        Icons.pedal_bike,
                        const VistaCiclismo(),
                      ),
                      _buildExerciseCard(
                        context,
                        "Pilates",
                        Icons.self_improvement,
                        const VistaPilates(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // ------------------ SECCIÓN CONSEJOS ------------------
                Text(
                  "Consejos",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    _buildTipCard(
                      context,
                      "Fuerza",
                      Icons.fitness_center,
                      "Entrena 3 veces por semana",
                      const VistaFuerza(),
                    ),
                    _buildTipCard(
                      context,
                      "Cardio",
                      Icons.favorite,
                      "Haz al menos 30 min de cardio",
                      const VistaCardio(),
                    ),
                    _buildTipCard(
                      context,
                      "Flexibilidad",
                      Icons.accessibility_new,
                      "Estira después de entrenar",
                      const VistaFlexibilidad(),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  // Card de Ejercicio interactuable con ripple y navegación
  Widget _buildExerciseCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget destino,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destino));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Card de Consejo interactuable con ripple y navegación
  Widget _buildTipCard(
    BuildContext context,
    String title,
    IconData icon,
    String description,
    Widget destino,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destino));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
