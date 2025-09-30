import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EjercicioService {
  // Ajusta la URL según tu entorno
  static const String baseUrl = "http://localhost:3000/api/ejercicios";

  Future<List<Map<String, dynamic>>> getEjercicios() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 &&
        response.headers["content-type"]?.contains("application/json") ==
            true) {
      final List data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception("Error al obtener ejercicios: ${response.body}");
    }
  }
}
