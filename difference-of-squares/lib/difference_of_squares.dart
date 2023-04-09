import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int number) {
    int sum = 0;
    for (var i = 1; i <= number; i++) {
      sum += i;
    }
    return pow(sum, 2);
  }

  num sumOfSquares(int number) {
    num sum = 0;
    for (var i = 1; i <= number; i++) {
      sum += pow(i, 2);
    }
    return sum;
  }

  int differenceOfSquares(int num) {
    return num * (num + 1) * (num - 1) * ((3 * num) + 2) ~/ 12;
  }
}
