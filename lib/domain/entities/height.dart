class Height {
  final double cm;

  Height(this.cm);

  factory Height.fromDecimetres(double dm) => Height(dm * 10);
  factory Height.fromInches(double inches) => Height(inches * 2.54);
  factory Height.fromFeetInches(int feet, double inches) =>
      Height((feet * 12 + inches) * 2.54);

  double get metres => cm / 100;
  double get decimetres => cm / 10;
  double get inches => cm / 2.54;
  (int feet, double inches) get feetInches {
    int feet = (inches / 12).floor();
    double remainingInches = inches % 12;
    return (feet, remainingInches);
  }

  @override
  String toString() {
    final (feet, inches) = feetInches;

    String metric =
        cm < 100 ? '${cm.toInt()}cm' : '${(cm / 100).toStringAsFixed(2)}m';

    String imperial = feet > 0
        ? '${feet}ft ${inches.toStringAsFixed(1)}in'
        : '${inches.toStringAsFixed(1)}in';

    return '$metric ($imperial)';
  }
}
