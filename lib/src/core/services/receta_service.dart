import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecetaService {
  static const String baseUrl = "http://localhost:3000/api/recetas";
  static const String proxyBase = "http://localhost:3000/proxy-image?url=";

  // Función para envolver la URL original con el proxy
  String proxify(String originalUrl) {
    return "$proxyBase$originalUrl";
  }

  // Obtener todas las recetas
  Future<List<Map<String, dynamic>>> getRecetas() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      // Reescribir las URLs de imagen para que pasen por el proxy
      final recetas = data.map<Map<String, dynamic>>((receta) {
        final imagenOriginal = receta["imagenUrl"];
        receta["imagenUrl"] = imagenOriginal != null
            ? proxify(imagenOriginal)
            : null;
        return receta;
      }).toList();

      return recetas;
    } else {
      throw Exception("Error al obtener recetas: ${response.body}");
    }
  }

  // Obtener una receta por ID
  Future<Map<String, dynamic>> getRecetaById(String id) async {
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
      final receta = jsonDecode(response.body);

      final imagenOriginal = receta["imagenUrl"];
      receta["imagenUrl"] = imagenOriginal != null
          ? proxify(imagenOriginal)
          : null;

      return receta;
    } else {
      throw Exception("Error al obtener receta: ${response.body}");
    }
  }
}
