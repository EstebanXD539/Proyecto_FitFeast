import 'package:flutter/material.dart';

class PantallaDetalleReceta extends StatelessWidget {
  final String titulo;
  final String imagen;
  final String descripcion;

  const PantallaDetalleReceta({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Imagen de la receta
          SizedBox(height: 240, child: Image.asset(imagen, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Descripción
                Text(descripcion, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 32),

                // Botón Guardar Receta
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí puedes guardar la receta en favoritos
                    },
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
