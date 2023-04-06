import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    String numString = BigInt.parse(number).toString();
    num numResult = 0;
    for (String numChar in numString.split('')) {
      int convertedInt = int.parse(numChar);
      numResult += pow(convertedInt, numString.split('').length);
    }

    if (number == numResult.toString()) {
      return true;
    } else {
      return false;
    }
  }
}
