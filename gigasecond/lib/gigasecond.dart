DateTime addGigasecondTo(final DateTime dateTime) {
  return DateTime.fromMillisecondsSinceEpoch(
          dateTime.millisecondsSinceEpoch + (1000000000 * 1000))
      .toUtc();
}
