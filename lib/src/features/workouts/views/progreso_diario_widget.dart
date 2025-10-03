import 'package:flutter/material.dart';

class ProgresoDiarioWidget extends StatelessWidget {
  final int objetivo;
  final int comida;
  final int ejercicio;

  const ProgresoDiarioWidget({
    super.key,
    required this.objetivo,
    required this.comida,
    required this.ejercicio,
  });

  @override
  Widget build(BuildContext context) {
    int neto = comida - ejercicio;
    if (neto < 0) neto = 0;
    double progreso = neto / objetivo;
    if (progreso > 1.0) progreso = 1.0;

    Color progresoColor;
    if (progreso < 0.4) {
      progresoColor = Colors.redAccent;
    } else if (progreso < 0.75) {
      progresoColor = Colors.amber;
    } else {
      progresoColor = Colors.green;
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: progreso),
                duration: const Duration(seconds: 1),
                builder: (context, value, _) => CircularProgressIndicator(
                  value: value,
                  strokeWidth: 14,
                  backgroundColor: Theme.of(context).dividerColor,
                  color: progresoColor,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "${(progreso * 100).toInt()}%",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Progreso diario",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
                Text(
                  "Objetivo base $objetivo",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "Comida $comida • Ejercicio $ejercicio",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).hintColor),
        ),
      ],
    );
  }
}
