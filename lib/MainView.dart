import 'dart:math';

import 'package:converter/constants.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

String result = 'hi';
int startNum;
int base = 2;

String convertDecToBase(int dec, int base) {

  // works for now; no error checking yet
  String output = '';

  do {
    output += kChars[dec % base];
    dec = (dec/base).floor();
  } while (dec != 0);

  return output.split('').reversed.join();
}

String convertBaseToDec(String number, int base) {

  // works for now; no error checking yet
  if (base > 36) return 'Choose a smaller base.';

  int result;

  for (int i = number.length - 1; i >= 0; i--) {
    int position = kChars.indexOf(number.substring(i, i+1));
    result += pow(base, number.length - 1 - i) * position;
  }

  return result.toString();

}

class _MainViewState extends State<MainView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100.0,),
          InputRow(leftText: 'Number To Convert', rightText: 'From Base',),
          InputRow(leftText: 'Converted Number', rightText: 'To Base',),
          Expanded(
            child: Center(
              child: FlatButton(
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [Color(0xff85E326), Color(0xff0CECDE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
                    child: Text('Convert', style: kButtonStyle,),
                  ),
                ),
                onPressed: () {print('hi');},
              ),
            ),
          ),
          SizedBox(height: 100.0,),
        ],
      ),
    );
  }
}

class InputRow extends StatelessWidget {

  final String leftText;
  final String rightText;

  InputRow({@required this.leftText, @required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            InputSide(flex: 3, text: leftText,),
            InputSide(flex: 2, text: rightText,),
          ],
        ),
      ),
    );
  }
}

class InputSide extends StatelessWidget {

  final int flex;
  final String text;

  InputSide({@required this.flex, @required this.text});

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
                child: TextField(
                  cursorColor: Colors.white,
                  style: kLabel,
                  decoration: InputDecoration(
                    fillColor: Color(0xff424242),
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}