import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';

class ApiServices {
  static const String urlBase = 'https://official-joke-api.appspot.com/';

  static Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse('${urlBase}types'));
    if (response.statusCode == 200) {
      List<String> types = List<String>.from(json.decode(response.body));
      return types;
    } else {
      throw Exception('Failed to load joke types');
    }
  }
  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse('${urlBase}jokes/$type/ten'));
    if (response.statusCode == 200) {
      List<dynamic> jokesJson = json.decode(response.body);
      return jokesJson.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse('${urlBase}random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
