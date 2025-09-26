import 'package:app_fitfeast/src/features/nutrition_recipes/views/recipes_details_screen.dart';
import 'package:flutter/material.dart';

class PantallaRecetas extends StatelessWidget {
  const PantallaRecetas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),

            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar recetas",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Botones rápidos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _botonAcceso("Favoritos", Icons.favorite),
                _botonAcceso("Historial", Icons.history),
                _botonAcceso("Categoría", Icons.category),
              ],
            ),
            const SizedBox(height: 24),

            // Banner Menú Semanal
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('images/menu_semanal.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(12),
              child: const Text(
                "Menú Semanal",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sugerencias
            const Text(
              "Sugerencias",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _iconoCircular("Desayuno", Icons.free_breakfast),
                _iconoCircular("Almuerzo", Icons.lunch_dining),
                _iconoCircular("Merienda", Icons.cookie),
                _iconoCircular("Cena", Icons.rice_bowl),
              ],
            ),
            const SizedBox(height: 24),

            // Recetas
            const Text(
              "Recetas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 👇 Cada tarjeta ahora navega a PantallaDetalleReceta
            _tarjetaReceta(
              context,
              "Batido de proteínas y frutas",
              "images/batido_frutas.png",
              "Un batido energético con proteínas y frutas frescas ideal para después del entrenamiento.",
            ),
            const SizedBox(height: 12),
            _tarjetaReceta(
              context,
              "Batido de Kiwi con proteína",
              "images/batido_kiwi.jpg",
              "Refrescante batido de kiwi con proteína, perfecto para recuperar energía.",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Botón de acceso rápido
  Widget _botonAcceso(String texto, IconData icono) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icono, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(texto, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Ícono circular de sugerencia
  Widget _iconoCircular(String texto, IconData icono) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey.shade100,
          child: Icon(icono, size: 28, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Text(texto, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  // Tarjeta de receta con navegación
  Widget _tarjetaReceta(
    BuildContext context,
    String titulo,
    String imagen,
    String descripcion,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PantallaDetalleReceta(
              titulo: titulo,
              imagen: imagen,
              descripcion: descripcion,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(imagen), fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Brand",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
