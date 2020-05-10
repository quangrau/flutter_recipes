import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:cooking/models/recipe_result.dart';
import 'package:cooking/repository/recipes_repository.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  static const int PAGE_SIZE = 10;

  final String _query = 'pork';
  final String _cuisine = 'thai';
  final RecipesRepository recipesRepository;

  RecipesBloc({@required this.recipesRepository});

  @override
  RecipesState get initialState =>
      RecipesInitial(query: _query, cuisine: _cuisine);

  @override
  Stream<RecipesState> mapEventToState(
    RecipesEvent event,
  ) async* {
    if (event is Search) {
      yield* _mapRecipesSearchToState(event);
    }
    if (event is SearchLoadMore) {
      yield* _mapRecipesSearchLoadMoreToState(event);
    }
  }

  Stream<RecipesState> _mapRecipesSearchToState(Search event) async* {
    final RecipesInitial currentState = state;
    final String searchQuery = currentState.query;
    final String searchCuisine = currentState.cuisine;

    if (searchQuery.isEmpty) {
      yield SearchEmpty();
    } else {
      yield SearchLoading();
      try {
        final result = await recipesRepository.searchRecipes(
          query: searchQuery,
          cuisine: searchCuisine,
          offset: 0,
          number: PAGE_SIZE,
        );

        yield SearchSuccess(
          query: currentState.query,
          cuisine: currentState.cuisine,
          offset: result.offset,
          recipes: result.recipes,
          totalResults: result.totalResults,
        );
        return;
      } catch (error) {
        print(error);
        yield SearchError('Search Error');
      }
    }
  }

  Stream<RecipesState> _mapRecipesSearchLoadMoreToState(
      SearchLoadMore event) async* {
    if (state is SearchSuccess) {
      yield SearchLoadMoreLoading.fromStateAndPage(state);

      try {
        final SearchSuccess currentState = state;
        final result = await recipesRepository.searchRecipes(
          query: currentState.query,
          cuisine: currentState.cuisine,
          offset: currentState.offset + PAGE_SIZE,
          number: PAGE_SIZE,
        );

        yield SearchSuccess(
          query: currentState.query,
          cuisine: currentState.cuisine,
          offset: result.offset,
          recipes: currentState.recipes + result.recipes,
          totalResults: result.totalResults,
        );
      } catch (error) {
        yield SearchError('SearchLoadMore Error');
      }
    }
  }
}
