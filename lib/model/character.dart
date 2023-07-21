class Character {

  final String id;

  final String name;

  /// image path
  final String thumbnail;

  /// description of good
  final String description;

  const Character({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.description = '',
  });
}