import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
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

            // Foto y datos personales
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/profile.jpg',
                    ), // Reemplaza con tu imagen
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Luis Suarez",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "26 años • 170 cm • 70 kg",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Sección Favoritos
            const Text(
              "Favoritos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("Estadísticas"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text("Ejercicios Guardados"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Recetas Guardadas"),
              onTap: () {},
            ),
            const SizedBox(height: 24),

            // Sección Preferencias
            const Text(
              "Preferencias",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text("Notificaciones"),
              value: false,
              onChanged: (val) {},
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text("Tema"),
              subtitle: const Text("Oscuro"),
              onTap: () {},
            ),
            const SizedBox(height: 24),

            // Sección Cuenta
            const Text(
              "Cuenta",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Editar Información"),
              onTap: () {},
            ),
            const SizedBox(height: 32),

            // Botón Cerrar Sesión
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
