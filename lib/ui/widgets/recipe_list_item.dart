import 'package:flutter/material.dart';

import 'package:cooking/constants.dart';
import 'package:cooking/models/recipe_result.dart';
import 'package:cooking/ui/widgets/basic_card.dart';

class RecipeListItem extends StatelessWidget {
  final RecipeResult recipe;

  const RecipeListItem({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          recipe.title,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite,
              size: 14,
              color: kAccentColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '${recipe.servings}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: kAccentColor),
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            Icon(
              Icons.timer,
              size: 14,
              color: kAccentColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '${recipe.readyInMinutes} mins',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: kAccentColor),
              ),
            ),
          ],
        ),
      ],
    );
    return BasicCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 124,
            width: 124,
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kCardBorerRadius),
                bottomLeft: Radius.circular(kCardBorerRadius),
              ),
              image: DecorationImage(
                image: _buildImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 124,
              padding: EdgeInsets.all(kCardContentPadding),
              child: column,
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _buildImage(String imageURL) {
    return imageURL != null
        ? NetworkImage('https://spoonacular.com/recipeImages/$imageURL')
        : AssetImage('assets/images/recipe_placeholder.jpg');
  }
}
