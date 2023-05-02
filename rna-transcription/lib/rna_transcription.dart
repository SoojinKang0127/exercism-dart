class RnaTranscription {
  String toRna(String dna){
    Map<String, String> transcribedMap = {
      "A":"U",
      "G":"C",
      "C":"G",
      "T":"A"
    };
    return dna.split("").map((e) => transcribedMap[e]).join("");
  }
}
