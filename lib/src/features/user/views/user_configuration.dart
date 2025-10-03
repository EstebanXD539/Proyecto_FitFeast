import 'package:app_fitfeast/src/features/workouts/views/historial_ejercicios_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_fitfeast/src/features/auth_presentation/views/pantalla_bienvenida.dart';
import 'package:app_fitfeast/src/features/user/views/editar_informacion.dart';
import 'package:app_fitfeast/src/features/nutrition_recipes/views/recetas_guardadas_page.dart';
import 'package:app_fitfeast/src/features/workouts/views/ejercicios_guardados_page.dart';
import 'package:app_fitfeast/src/core/theme_controller.dart';
import 'package:app_fitfeast/src/core/services/auth_service.dart';

class PantallaUsuario extends StatelessWidget {
  const PantallaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final AuthService authService = AuthService();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    backgroundImage: AssetImage('images/perfil.png'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Luis Suarez",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "26 años • 170 cm • 70 kg",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
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
              title: const Text("Historial"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HistorialEjerciciosPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text("Ejercicios Guardados"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EjerciciosGuardadosPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Recetas Guardadas"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RecetasGuardadasPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Sección Preferencias
            const Text(
              "Preferencias",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text("Modo Oscuro"),
              value: themeController.isDarkMode,
              onChanged: (_) => themeController.toggleTheme(),
              secondary: const Icon(Icons.brightness_6),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditarInformacionPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),

            // Botón Cerrar Sesión
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await authService.logout();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PantallaBienvenida(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const RoundedRectangleBorder(
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
