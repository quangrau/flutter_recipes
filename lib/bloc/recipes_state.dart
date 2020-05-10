part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  final String query;
  final String cuisine;

  const RecipesState({this.query, this.cuisine});

  @override
  List<Object> get props => [query, cuisine];
}

class RecipesInitial extends RecipesState {
  const RecipesInitial({String query, String cuisine})
      : super(query: query, cuisine: cuisine);

  @override
  String toString() => 'RecipesInitial { query: $query, cuisine: $cuisine }';
}

class SearchEmpty extends RecipesState {
  @override
  String toString() => 'SearchEmpty';
}

class SearchLoading extends RecipesState {
  @override
  String toString() => 'SearchLoading';
}

class SearchSuccess extends RecipesState {
  final List<RecipeResult> recipes;
  final String query;
  final String cuisine;
  final int offset;
  final int totalResults;

  const SearchSuccess({
    this.query,
    this.cuisine,
    this.recipes,
    this.offset,
    this.totalResults,
  });

  @override
  List<Object> get props => [recipes, offset, totalResults];

  @override
  String toString() =>
      'SearchSuccess { query: $query, cuisine: $cuisine, recipes: ${recipes.length}, offset: $offset, totalResults: $totalResults }';
}

class SearchLoadMoreLoading extends SearchSuccess {
  SearchLoadMoreLoading.fromStateAndPage(SearchSuccess state)
      : super(
          recipes: state.recipes,
          offset: state.offset,
          totalResults: state.totalResults,
        );

  @override
  String toString() => 'SearchLoadMoreLoading';
}

class SearchError extends RecipesState {
  final String error;

  SearchError(this.error);

  @override
  String toString() => 'SearchError { error: $error }';
}
