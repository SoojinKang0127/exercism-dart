class SumOfMultiples {
  int sum(List<int> items, int level) {
    Set<int> numbers = {};

    for (var item in items) {
      int i = 1;
      while (item * i < level) {
        if (item == 0) break;
        numbers.add(item * i);
        i++;
      }
    }

    if (numbers.length == 0) {
      return 0;
    } else {
      return numbers.reduce((value, element) => value + element);
    }
  }
}
