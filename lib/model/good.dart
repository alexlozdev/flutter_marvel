class Good {

  final String id;

  final String name;

  /// image path
  final String image;

  /// description of good
  final String description;

  const Good({
    required this.id,
    required this.name,
    required this.image,
    this.description = '',
  });
}