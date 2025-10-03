import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // ⚠️ IMPORTANTE: en dispositivos físicos/emuladores NO uses "localhost"
  // Usa tu IP local (ej: "http://192.168.1.10:3000")
  final String baseUrlUsuarios = "http://localhost:3000/api/usuarios";
  final String baseUrlProgreso = "http://localhost:3000/api/progreso";

  // ------------------ AUTH ------------------

  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrlUsuarios/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["error"] ?? "Error en registro");
    }
  }

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrlUsuarios/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data["token"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      return true;
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["error"] ?? "Error en login");
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final token = await getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse("$baseUrlUsuarios/profile"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  // ------------------ PROGRESO ------------------

  /// Obtener el progreso actual del usuario
  Future<Map<String, dynamic>?> getProgreso() async {
    final token = await getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse(baseUrlProgreso),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  /// Actualizar progreso (sumar comida o ejercicio)
  Future<Map<String, dynamic>?> updateProgreso({
    int comida = 0,
    int ejercicio = 0,
  }) async {
    final token = await getToken();
    if (token == null) return null;

    final response = await http.put(
      Uri.parse(baseUrlProgreso),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"comida": comida, "ejercicio": ejercicio}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["error"] ?? "Error al actualizar progreso");
    }
  }

  /// Crear un progreso inicial (ej. al registrarse)
  Future<Map<String, dynamic>?> createProgreso({int objetivo = 1500}) async {
    final token = await getToken();
    if (token == null) return null;

    final response = await http.post(
      Uri.parse(baseUrlProgreso),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"objetivo": objetivo, "comida": 0, "ejercicio": 0}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error["error"] ?? "Error al crear progreso");
    }
  }
}
