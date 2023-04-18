class Bob {
  String response(String text) {
    String result = "Whatever.";
    if (isQuestion(text)) {
      result = "Sure.";
      if (isAllUpperCase(text)) {
        result = "Calm down, I know what I'm doing!";
      }
    } else if (isAllUpperCase(text)) {
      result = "Whoa, chill out!";
    } else if (isSilence(text)) {
      result = "Fine. Be that way!";
    }
    return result;
  }

  bool isQuestion(String text) {
    RegExp regexp = RegExp(r"^.*\?\s*$");
    return regexp.hasMatch(text);
  }

  bool isAllUpperCase(String text) {
    RegExp regexp = RegExp(r"^[A-Z0-9!@#$%^&*()_+,\-./:;<=>?@\[\]{}|~ ]*[A-Z][A-Z0-9!@#$%^&*()_+,\-./'':;<=>?@\[\]{}|~ ]*$");
    return regexp.hasMatch(text);
  }

  bool isSilence(String text) {
    RegExp regexp = RegExp(r"^[\s\n\t]*$");
    return regexp.hasMatch(text);
  }
}
