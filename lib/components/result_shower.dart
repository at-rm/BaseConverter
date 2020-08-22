import 'package:flutter/material.dart';

import '../constants.dart';

class ResultShower extends StatelessWidget {

  final String result;

  ResultShower({@required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
      child: Text(result, style: kLabel, textAlign: TextAlign.left,),
    );
  }

}