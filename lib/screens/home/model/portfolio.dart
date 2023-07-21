class Portfolio {
  /// image path
  final String image;

  /// comment 1
  final String comment1;

  /// comment2
  final String comment2;

  /// updating date
  final String date;

  const Portfolio({
    required this.image,
    required this.comment1,
    required this.comment2,
    this.date = '',
  });

}