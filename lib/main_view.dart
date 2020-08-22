import 'package:converter/constants.dart';
import 'package:converter/converter_brain.dart';
import 'package:flutter/material.dart';

import 'components/input_row.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

// default start values
String result = ' ';
String startNum = '0';
int fromBase = 10;
int toBase = 2;

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
            onChangedRight: (String text) {
              setState(() {
                toBase = int.parse(text);
              });
            },
            result: result,
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
                    ConverterBrain brain = ConverterBrain(startNum, fromBase, toBase);
                    result = brain.convert();
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