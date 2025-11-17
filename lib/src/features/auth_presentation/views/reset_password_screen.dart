import 'package:flutter/material.dart';

class ReseteoContrasena extends StatelessWidget {
  const ReseteoContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 60),

            // Título centrado
            const Center(
              child: Text(
                "Reseteo Contraseña",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),

            // Instrucciones
            const Text(
              "Ingresa el correo electrónico vinculado a tu cuenta y te enviaremos las instrucciones para restablecer tu contraseña.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 32),

            // Campo Email
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "email@domain.com",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),

            // Botón azul oscuro, rectangular, texto blanco
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003366), // Azul oscuro
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Rectangular
                  ),
                ),
                child: const Text(
                  "Enviar Instrucciones",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 32),

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
