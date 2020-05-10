part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Search extends RecipesEvent {
  final String query;
  final String cuisine;

  Search({this.query, this.cuisine});

  @override
  String toString() => "ReceipsSearch { query: $query, cuisine: $cuisine }";
}

class SearchLoadMore extends RecipesEvent {
  @override
  String toString() => "ReceipsSearchLoadMore";
}
