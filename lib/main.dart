import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cooking/bloc/recipes_bloc.dart';
import 'package:cooking/repository/recipes_client.dart';
import 'package:cooking/repository/recipes_repository.dart';
import 'package:cooking/ui/pages/home.dart';

void main() {
  final RecipesRepository _recipesRepository =
      RecipesRepository(RecipesClient());

  runApp(MyApp(recipesRepository: _recipesRepository));
}

class MyApp extends StatelessWidget {
  final RecipesRepository recipesRepository;

  const MyApp({Key key, @required this.recipesRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipesBloc>(
          create: (BuildContext context) =>
              RecipesBloc(recipesRepository: recipesRepository),
        ),
      ],
      child: MaterialApp(
        title: 'My Receipts',
        theme: ThemeData(
          fontFamily: "Sanomat",
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            bodyText2: TextStyle(fontSize: 14.0),
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
