class Currency {
  final String code;
  final String symbol;
  final String name;
  final int decimalPlaces;
  final double rateFromXaf;

  const Currency({
    required this.code,
    required this.symbol,
    required this.name,
    required this.decimalPlaces,
    required this.rateFromXaf,
  });
}
