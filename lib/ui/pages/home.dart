import 'package:flutter/material.dart';

import 'package:cooking/constants.dart';
import 'package:cooking/ui/components/recipe_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: kAccentColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: kAccentColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                "Recipes",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: kAccentColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Expanded(child: RecipeList()),
          ],
        ),
      ),
    );
  }
}
