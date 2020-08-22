import 'package:flutter/material.dart';

import '../constants.dart';

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