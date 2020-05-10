import 'package:cooking/models/recipe_result.dart';

class RecipesSearchResult {
  List<RecipeResult> recipes;
  int offset;
  int totalResults;

  RecipesSearchResult({
    this.recipes,
    this.offset,
    this.totalResults,
  });
}
