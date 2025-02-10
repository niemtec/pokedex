class Weight {
  final double kg;
  Weight(this.kg);

  factory Weight.fromHectograms(double hg) => Weight(hg / 10);
  factory Weight.fromPounds(double lb) => Weight(lb / 2.20462);
  factory Weight.fromStonesAndPounds(int stones, double pounds) =>
      Weight((stones * 14 + pounds) / 2.20462);

  double get hectograms => kg * 10;
  double get pounds => kg * 2.20462;

  (int stones, double pounds) get stonesAndPounds {
    int stones = (pounds / 14).floor();
    double remainingPounds = pounds % 14;
    return (stones, remainingPounds);
  }

  @override
  String toString() {
    final (stones, pounds) = stonesAndPounds;
    String metric = kg < 1 ? '${(kg * 1000).toInt()}g' : '${kg.toStringAsFixed(2)}kg';
    String imperial = stones > 0
        ? '${stones}st ${pounds.toStringAsFixed(1)}lb'
        : '${pounds.toStringAsFixed(1)}lb';

    return '$metric ($imperial)';
  }
}
