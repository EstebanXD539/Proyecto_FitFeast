import 'package:app_fitfeast/src/features/auth_presentation/views/receta_service.dart';
import 'package:flutter/material.dart';
import 'recipes_details_screen.dart';

class PantallaRecetas extends StatefulWidget {
  const PantallaRecetas({super.key});

  @override
  State<PantallaRecetas> createState() => _PantallaRecetasState();
}

class _PantallaRecetasState extends State<PantallaRecetas> {
  final RecetaService _recetaService = RecetaService();
  late Future<List<Map<String, dynamic>>> _futureRecetas;

  @override
  void initState() {
    super.initState();
    _futureRecetas = _recetaService.getRecetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureRecetas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay recetas"));
          }

          final recetas = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              final receta = recetas[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PantallaDetalleReceta(receta: receta),
                    ),
                  );
                },
                child: Container(
                  height: 160,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: receta["imagenUrl"] != null
                        ? DecorationImage(
                            image: NetworkImage(receta["imagenUrl"]),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    receta["titulo"] ?? "Sin título",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
