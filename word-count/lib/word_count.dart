class WordCount {
  Map<String, int> countWords(String text) {
    Map<String, int> result = {};
    RegExp exp = RegExp(r"(\w[\w']*\w|\w)");
    Iterable<RegExpMatch> matches = exp.allMatches(text.toLowerCase());
    for (final m in matches) {
      String? word = m[0];
      if (word == null) {
        break;
      }

      if (result.keys.contains(m[0])) {
        result[word] = (result[word] ?? 0) + 1;
      } else {
        result[word] = 1;
      }
    }

    return result;
  }
}
