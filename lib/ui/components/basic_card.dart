import 'package:cooking/constants.dart';
import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  final Widget child;

  const BasicCard({
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kCardMargin,
        vertical: kCardMargin,
      ),
      decoration: BoxDecoration(
        color: kBackgroundCardColor,
        borderRadius: BorderRadius.circular(kCardBorerRadius),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            offset: new Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: -4.0,
          ),
        ],
      ),
      child: child ?? Container(),
    );
  }
}
