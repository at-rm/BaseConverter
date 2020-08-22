import 'package:flutter/material.dart';

import 'input_side.dart';
import 'number_text_field.dart';
import 'result_shower.dart';

class InputRow extends StatelessWidget {

  final String leftText;
  final String rightText;
  final bool isTextField;
  final Function onChangedLeft;
  final Function onChangedRight;
  final String result;

  InputRow({@required this.leftText, @required this.rightText, @required this.isTextField, this.onChangedLeft, @required this.onChangedRight, this.result});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            InputSide(
              flex: 3,
              text: leftText,
              child: isTextField ? NumberTextField(onChanged: onChangedLeft,) : ResultShower(result: result,),
            ),
            InputSide(
              flex: 2,
              text: rightText,
              child: NumberTextField(onChanged: onChangedRight,),
            ),
          ],
        ),
      ),
    );
  }
}