import 'package:flutter/material.dart';

import '../constants.dart';

class InputSide extends StatelessWidget {

  final int flex;
  final String text;
  final Widget child;

  InputSide({@required this.flex, @required this.text, @required this.child, });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
                child: Text(text, style: kLabel, textAlign: TextAlign.left,),
              ),
            ),
            Expanded(
              flex: 5,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}