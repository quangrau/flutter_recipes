import 'package:cooking/model/recipes_search_result.dart';
import 'package:cooking/repository/recipes_client.dart';

class RecipesRepository {
  final RecipesClient client;

  RecipesRepository(this.client);

  Future<RecipesSearchResult> searchRecipes(
      {String query, String cuisine, int offset = 0, int number = 10}) async {
    final response = await client.searchRecipes(
      query: query,
      cuisine: cuisine,
      offset: offset,
      number: number,
    );

    final result = RecipesSearchResult(
      recipes: response.results,
      offset: response.offset,
      totalResults: response.totalResults,
    );

    return result;
  }
}
