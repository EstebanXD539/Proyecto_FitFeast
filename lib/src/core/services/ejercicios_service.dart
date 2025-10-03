import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EjercicioService {
  // Ajusta la URL según tu entorno
  static const String baseUrl = "http://localhost:3000/api/ejercicios";
  static const String proxyBase = "http://localhost:3000/proxy-image?url=";

  // Función para envolver la URL original con el proxy
  String proxify(String? originalUrl) {
    if (originalUrl == null) return "";
    return "$proxyBase$originalUrl";
  }

  // Obtener todos los ejercicios
  Future<List<Map<String, dynamic>>> getEjercicios() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 &&
        response.headers["content-type"]?.contains("application/json") ==
            true) {
      final List data = jsonDecode(response.body);

      // Reescribir las URLs de imagen para que pasen por el proxy
      final ejercicios = data.map<Map<String, dynamic>>((ejercicio) {
        final imagenOriginal = ejercicio["imagenUrl"];
        ejercicio["imagenUrl"] = imagenOriginal != null
            ? proxify(imagenOriginal)
            : null;
        return ejercicio;
      }).toList();

      return ejercicios;
    } else {
      throw Exception("Error al obtener ejercicios: ${response.body}");
    }
  }

  // Obtener un ejercicio por ID
  Future<Map<String, dynamic>> getEjercicioById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final ejercicio = jsonDecode(response.body);

      final imagenOriginal = ejercicio["imagenUrl"];
      ejercicio["imagenUrl"] = imagenOriginal != null
          ? proxify(imagenOriginal)
          : null;

      return ejercicio;
    } else {
      throw Exception("Error al obtener ejercicio: ${response.body}");
    }
  }
}
