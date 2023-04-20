double earthSeconds = 31557600;
Map<String, double> ratio = {
  "Earth": 1.0,
  "Mercury": 0.2408467,
  "Venus": 0.61519726,
  "Mars": 1.8808158,
  "Jupiter": 11.862615,
  "Saturn": 29.447498,
  "Uranus": 84.016846,
  "Neptune": 164.79132
};

class SpaceAge {
  double age({required String planet, required double seconds}) {
    return double.parse(
        (seconds / (earthSeconds * (ratio[planet] ?? 0))).toStringAsFixed(2));
  }
}
