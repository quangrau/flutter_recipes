import 'package:cooking/models/recipe_result.dart';

class RecipesSearchResponse {
  List<RecipeResult> results;
  String baseUri;
  int offset;
  int number;
  int totalResults;
  int processingTimeMs;
  int expires;
  bool isStale;

  RecipesSearchResponse({
    this.results,
    this.baseUri,
    this.offset,
    this.number,
    this.totalResults,
    this.processingTimeMs,
    this.expires,
    this.isStale,
  });

  RecipesSearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<RecipeResult>();
      json['results'].forEach((v) {
        results.add(new RecipeResult.fromJson(v));
      });
    }
    baseUri = json['baseUri'];
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
    processingTimeMs = json['processingTimeMs'];
    expires = json['expires'];
    isStale = json['isStale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['baseUri'] = this.baseUri;
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    data['processingTimeMs'] = this.processingTimeMs;
    data['expires'] = this.expires;
    data['isStale'] = this.isStale;
    return data;
  }
}
