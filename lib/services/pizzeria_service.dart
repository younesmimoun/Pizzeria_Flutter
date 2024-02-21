import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Pizza.dart';

class PizzeriaService {
  static final String uri =
      "http://localhost:8888/api/pizzas/"; // Corrected URI

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];
    try {
      final response =
          await http.get(Uri.parse(uri)); // Updated to use the corrected URI
      if (response.statusCode == 200) {
        var jsonData = json.decode(utf8.decode(response.bodyBytes));
        for (final value in jsonData) {
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception("Impossible de récupérer les pizzas");
      }
    } catch (e) {
      throw e;
    }
    return list;
  }
}
