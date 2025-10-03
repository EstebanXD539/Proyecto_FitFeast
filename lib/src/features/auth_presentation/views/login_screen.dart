import 'package:app_fitfeast/src/core/navigation_bottom_bar.dart';
import 'package:app_fitfeast/src/features/auth_presentation/views/register_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/services/auth_service.dart';

class LoginFitFeast extends StatefulWidget {
  const LoginFitFeast({super.key});

  @override
  State<LoginFitFeast> createState() => _LoginFitFeastState();
}

class _LoginFitFeastState extends State<LoginFitFeast> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final AuthService _authService = AuthService();

  bool _loading = false;
  String? _error;
  bool _obscurePassword = true;

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    // Mostrar pantalla de carga
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => const LoadingScreen(),
      ),
    );

    try {
      final success = await _authService.login(
        emailCtrl.text.trim(),
        passCtrl.text.trim(),
      );

      setState(() => _loading = false);

      if (success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login exitoso")));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NavigationBottomBar()),
        );
      } else {
        setState(() => _error = "Credenciales inválidas");
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
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
                "Iniciar Sesión",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Digita tu correo y contraseña para poder entrar en la app y ver su contenido",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
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
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscurePassword,
                validator: (value) => value == null || value.isEmpty
                    ? "Este campo es obligatorio"
                    : null,
              ),
              const SizedBox(height: 24),
              if (_error != null)
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ElevatedButton(
                onPressed: _loading ? null : _onLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿No tienes cuenta? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegistroFitFeast(),
                        ),
                      );
                    },
                    child: const Text(
                      "Crear cuenta",
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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Cierra la pantalla de carga automáticamente
    });

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 3),
      ),
    );
  }
}
