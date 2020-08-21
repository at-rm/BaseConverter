import 'dart:math';
import 'package:converter/constants.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

String result = ' ';
String startNum = '0';
int fromBase = 10;
int toBase = 2;

String convertDecToBase(String dec, int base) {

  // works for now; no error checking yet
  String output = '';

  int decNum = int.parse(dec);
  do {
    output += kChars[decNum % base];
    decNum = (decNum/base).floor();
  } while (decNum != 0);

  return output.split('').reversed.join();
}

String convertBaseToDec(String number, int base) {

  // works for now; no error checking yet
  if (base > 36) return 'Choose a smaller base.';

  // in case user types in upper case numbers
  number = number.trim();
  number = number.toLowerCase();
  int result = 0;

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
          InputRow(
            leftText: 'Number To Convert',
            rightText: 'From Base',
            isTextField: true,
            onChangedLeft: (String text) {
              setState(() {
                startNum = text;
              });
            },
            onChangedRight: (String text) {
              setState(() {
                fromBase = int.parse(text);
              });
            },
          ),
          InputRow(
            leftText: 'Converted Number',
            rightText: 'To Base',
            isTextField: false,
            onChangedLeft: () {
              print('Do nothing');
            },
            onChangedRight: (String text) {
              setState(() {
                toBase = int.parse(text);
              });
            },
          ),
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
                onPressed: () {
                  setState(() {
                    result = convertDecToBase(convertBaseToDec(startNum, fromBase), toBase);
                  });
                },
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
  final bool isTextField;
  final Function onChangedLeft;
  final Function onChangedRight;

  InputRow({@required this.leftText, @required this.rightText, @required this.isTextField, @required this.onChangedLeft, @required this.onChangedRight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            InputSide(flex: 3, text: leftText, child: isTextField ? NumberTextField(onChanged: onChangedLeft,) : ResultShower(),),
            InputSide(flex: 2, text: rightText, child: NumberTextField(onChanged: onChangedRight,),),
          ],
        ),
      ),
    );
  }
}

class ResultShower extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
        child: Text(result, style: kLabel, textAlign: TextAlign.left,),
    );
  }

}

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

class NumberTextField extends StatelessWidget {

  final Function onChanged;

  NumberTextField({@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
      child: TextField(
        onChanged: onChanged,
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
    );
  }
}