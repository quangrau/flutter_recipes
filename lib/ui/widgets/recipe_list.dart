import 'package:cooking/bloc/recipes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cooking/ui/widgets/recipe_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  String _query = 'chicken';
  String _cuisine = 'thai';

  RecipesBloc _recipesBloc;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    _recipesBloc = BlocProvider.of<RecipesBloc>(context);
    _recipesBloc.add(Search(query: _query, cuisine: _cuisine));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchError) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('failed to fetch recieps'),
                RaisedButton(
                  child: Text('Fetch'),
                  onPressed: () {
                    _recipesBloc.add(Search(query: _query, cuisine: _cuisine));
                  },
                ),
              ],
            ),
          );
        }

        if (state is SearchSuccess) {
          if (state.recipes.isEmpty) {
            return Center(
              child: Text('no recieps'),
            );
          }

          return Container(
            child: ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeListItem(recipe: state.recipes[index]);
              },
              controller: _scrollController,
            ),
          );
        }

        return Center();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = BlocProvider.of<RecipesBloc>(context).state;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold &&
        state is! SearchLoadMoreLoading) {
      print(state);
      _recipesBloc.add(SearchLoadMore());
    }
  }
}
