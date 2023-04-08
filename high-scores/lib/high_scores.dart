class HighScores {
  final List<int> scores;
  HighScores(List<int> this.scores);

  int latest() {
    return scores.last;
  }

  int personalBest() {
    var copy = [...scores];
    copy.sort();
    return copy.last;
  }

  List<int> personalTopThree() {
    var copy = [...scores];
    copy.sort();
    var reversed = copy.reversed;

    return reversed.toList().getRange(0, 2).toList();
  }
}
