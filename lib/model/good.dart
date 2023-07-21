import 'package:equatable/equatable.dart';

import '../utility/json_utility.dart';
import 'thumbnail.dart';

class Good extends Equatable{
  static const String keyId = 'id';
  static const String keyName = 'name';
  static const String keyDescription = 'description';
  static const String keyThumbnail = 'thumbnail';

  final int id;

  final String name;

  /// description of good
  final String description;

  /// thumbnail
  final Thumbnail thumbnail;

  const Good({
    required this.id,
    required this.name,
    this.description = '',
    required this.thumbnail,
  });

  Good copyWith({
    int? id,
    String? name,
    String? description,
    Thumbnail? thumbnail,
  }) {
    return Good(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [id, name, description, thumbnail];

  /// parse map to object
  static fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> mapThumbnail = JsonUtility.getMapValueFromMap(map, keyThumbnail, {});

    return Good(
      id: JsonUtility.getIntValueFromMap(map, keyId, 0),
      name: JsonUtility.getStringValueFromMap(map, keyName, ''),
      description: JsonUtility.getStringValueFromMap(map, keyDescription, ''),
      thumbnail: Thumbnail.fromJson(mapThumbnail),
    );
  }

  /// convert object to map
  Map<String, dynamic> toMap() {
    return {
      keyId: id,
      keyName: name,
      keyDescription: description,
      keyThumbnail: thumbnail.toMap(),
    };
  }
}
