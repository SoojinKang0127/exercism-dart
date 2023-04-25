class Raindrops {
  String convert(int number) {
    String result = "";

    if (hasNumAsFactor(number, 3)) {
      result += "Pling";
    }

    if (hasNumAsFactor(number, 5)) {
      result += "Plang";
    }

    if (hasNumAsFactor(number, 7)) {
      result += "Plong";
    }

    return result == "" ? number.toString() : result;
  }

  bool hasNumAsFactor(int dividend, int divisor){
    return dividend % divisor == 0 ? true : false;
  }
}