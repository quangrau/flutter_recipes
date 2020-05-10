import 'package:cooking/constants.dart';
import 'package:flutter/material.dart';

class IngredientsFAB extends StatefulWidget {
  const IngredientsFAB({
    Key key,
  }) : super(key: key);

  @override
  _IngredientsFABState createState() => _IngredientsFABState();
}

class _IngredientsFABState extends State<IngredientsFAB> {
  bool showButton = true;

  void _fetchIngredientList() {}

  @override
  void initState() {
    super.initState();

    _fetchIngredientList();
  }

  @override
  Widget build(BuildContext context) {
    return showButton
        ? _buildButton(context)
        : FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.close),
          );
  }

  void _showFoatingActionButton(bool value) {
    setState(() {
      showButton = value;
    });
  }

  FloatingActionButton _buildButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        var _bottomSheetController = showBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: kShadowColor,
                  blurRadius: 8.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.4),
                ),
              ],
              color: Colors.white,
            ),
            height: 300,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Search for ingredients',
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        );

        _showFoatingActionButton(false);

        _bottomSheetController.closed.then((value) {
          _showFoatingActionButton(true);
        });
      },
      tooltip: 'Open',
      child: Icon(Icons.receipt),
    );
  }
}
