import 'package:flutter/material.dart';

class LoginFitFeast extends StatelessWidget {
  const LoginFitFeast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 60),
            // Logo y nombre
            Center(
              child: Column(
                children: const [
                  Icon(Icons.fastfood, size: 64, color: Colors.black),
                  SizedBox(height: 8),
                  Text(
                    "FitFeast",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Iniciar Sesión",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Digita tu correo y contraseña para poder entrar en la app y ver su contenido",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Campo Email
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "email@domain.com",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Campo Contraseña
            TextField(
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),

            // Botón Iniciar Sesión
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Separador
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("o"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),

            // Botón Google
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata, size: 28),
              label: const Text("Continuar con Google"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 12),

            // Botón Apple
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.apple, size: 28),
              label: const Text("Continuar con Apple"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 24),

            // Aviso legal
            const Text(
              "Al hacer clic en continuar, aceptas nuestros Términos de Servicio y Política de Privacidad.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
