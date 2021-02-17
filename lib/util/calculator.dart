import 'package:flutter/foundation.dart';

/// core calculator class
/// below are names of values
/// "Base" -> "種族値"
/// "Nature" -> "性格補正"
/// "Individual" -> "個体値"
/// "Effort" -> "努力値"
class Calculator {
  /// calculate actual HP value
  static int toActualHp(
    int base, {
    double nature = 1.0,
    int individual = 31,
    int effort = 0,
    int level = 50,
  }) {
    return (base * 2 + individual + effort ~/ 4) * level ~/ 100 + level + 10;
  }

  /// calculate actual stat value other than HP
  static int toActualStatus(
    int base, {
    double nature = 1.0,
    int individual = 31,
    int effort = 0,
    int level = 50,
  }) {
    return (((base * 2 + individual + effort ~/ 4) * level ~/ 100 + 5) * nature)
        .toInt();
  }

  /// calculate approximate damage
  static List<int> toDamage(
    int attack,
    int defence,
    int power, {
    int level = 50,
    double scaleFactor = 1.0,
  }) {
    if (defence == 0) return [0, 0];

    final max = ((level * 2 ~/ 5 + 2) * power * attack ~/ defence) ~/ 50 + 2;
    final withScale = (max * scaleFactor).toInt();
    return [(withScale * 0.85).toInt(), withScale];
  }
}
