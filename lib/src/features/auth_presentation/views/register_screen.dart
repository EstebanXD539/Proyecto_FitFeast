import 'package:app_fitfeast/src/core/services/auth_service.dart';
import 'package:app_fitfeast/src/features/auth_presentation/views/login_screen.dart';
import 'package:flutter/material.dart';

class RegistroFitFeast extends StatefulWidget {
  const RegistroFitFeast({super.key});

  @override
  State<RegistroFitFeast> createState() => _RegistroFitFeastState();
}

class _RegistroFitFeastState extends State<RegistroFitFeast> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  final AuthService _authService = AuthService();

  void _onContinue() async {
    if (!_formKey.currentState!.validate()) return;

    // Mostrar pantalla de carga
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoadingScreen()),
    );

    try {
      final success = await _authService.register(
        nameCtrl.text.trim(),
        emailCtrl.text.trim(),
        passCtrl.text.trim(),
      );

      Navigator.pop(context); // quitar loading

      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginFitFeast()),
        );
      }
    } catch (e) {
      Navigator.pop(context); // quitar loading
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              const SizedBox(height: 60),
              Center(
                child: Column(
                  children: const [
                    Icon(Icons.fitness_center, size: 48, color: Colors.black),
                    SizedBox(height: 8),
                    Text(
                      "FitFeast",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Registro de Usuario",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Coloca tu email para entrar en la app",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? "Este campo es obligatorio"
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "email@domain.com",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? "Este campo es obligatorio"
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passCtrl,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? "Este campo es obligatorio"
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Continuar", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿Ya tienes cuenta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginFitFeast(),
                        ),
                      );
                    },
                    child: const Text(
                      "Inicia Sesion",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 3),
      ),
    );
  }
}
