class Hamming {
  int distance(String strand1, String strand2) {
    List<String> st1 = strand1.split("");
    List<String> st2 = strand2.split("");

    if (st1.length != st2.length) {
      throw ArgumentError('strands must be of equal length');
    }

    int result = 0;
    for (var i = 0; i < st1.length; i++) {
      if (st1[i] != st2[i]) {
        result++;
      }
    }
    return result;
  }
}
