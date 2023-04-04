class Leap {
  bool leapYear(int year) {
    if (year % 4 != 0) {
      return false;
    }

    if (year % 100 != 0) {
      return false;
    }

    if (year % 400 != 0) {
      return false;
    }

    return true;
  }
}
