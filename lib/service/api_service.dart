import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/chracter_model.dart';

class ApiService {
  final String baseUrl = "https://hp-api.onrender.com/api";

  Future<List<Chracter>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Chracter> characters =
          body.map((dynamic item) => Chracter.fromJson(item)).toList();
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
