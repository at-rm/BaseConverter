import 'dart:math';

import 'constants.dart';

class ConverterBrain {

  final String _number;
  final int _from;
  final int _to;

  ConverterBrain(this._number, this._from, this._to);

  String _convertDecToBase(String dec, int base) {
    // this is only called on the result of convertBaseToDec,
    // therefore the dec number is already normalized
    String output = '';

    int decNum = int.parse(dec);
    do {
      output += kChars[decNum % base];
      decNum = (decNum/base).floor();
    } while (decNum != 0);

    return output.split('').reversed.join();
  }

  String _convertBaseToDec(String startNum, int base) {
    // in case user types in upper case letters or wants to put spaces, normalize
    startNum = startNum.trim();
    startNum = startNum.replaceAll(' ', '');
    startNum = startNum.toUpperCase();
    int result = 0;

    for (int i = startNum.length - 1; i >= 0; i--) {
      int position = kChars.indexOf(startNum.substring(i, i+1));
      result += pow(base, startNum.length - 1 - i) * position;
    }

    return result.toString();

  }

  String convert() {
    return _convertDecToBase(_convertBaseToDec(_number, _from), _to);
  }
}