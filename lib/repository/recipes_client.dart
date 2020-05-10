import 'package:cooking/models/recipes_search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class RecipesClient {
  final http.Client httpClient = http.Client();
  final _apiKey = '8431d578664c4c3e81bf0230e25b2586';
  final _apiHost = 'api.spoonacular.com';

  Future<RecipesSearchResponse> searchRecipes(
      {String query, String cuisine, int offset = 0, int number = 10}) async {
    final response = await request(
      path: 'recipes/search',
      parameters: {
        'query': query,
        'cuisine': cuisine,
        'offset': offset.toString(),
        'number': number.toString(),
      },
    );

    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return RecipesSearchResponse.fromJson(results);
    } else {
      throw Exception('Error fetching recipes');
    }
  }

  // Future<List<Recipe>> fetchRecipesByIngredients(String ingredients,
  //     {int number = 10}) async {
  //   final response = await request(
  //     path: 'recipes/findByIngredients',
  //     parameters: {'ingredients': ingredients, 'number': number.toString()},
  //   );

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body) as List;
  //     return data.map((rawData) => Recipe.fromJson(rawData)).toList();
  //   } else {
  //     throw Exception('Error fetching recipes');
  //   }
  // }

  Future<http.Response> request({
    @required String path,
    Map<String, String> parameters,
  }) async {
    // Add API_KEY
    parameters["apiKey"] = _apiKey;

    // Build URI
    final uri = Uri.https(_apiHost, path, parameters);
    print(uri);

    // Request
    final response = await httpClient.get(uri, headers: _headers);
    return response;
  }

  Map<String, String> get _headers => {'Accept': 'application/json'};
}
