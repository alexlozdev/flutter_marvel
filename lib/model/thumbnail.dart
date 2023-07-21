import 'package:equatable/equatable.dart';

import '../utility/json_utility.dart';

class Thumbnail extends Equatable {
  static const keyPath = 'path';
  static const keyExtension = 'extension';

  final String path;

  final String extension;

  const Thumbnail({
    required this.path,
    required this.extension,
  });

  Thumbnail copyWith({
    String? path,
    String? extension,
  }) {
    return Thumbnail(
      path: path ?? this.path,
      extension: extension ?? this.extension,
    );
  }

  @override
  List<Object?> get props => [path, extension];

  /// get thumbnail image path
  String getImagePath() {
    if (path.isEmpty || extension.isEmpty) {
      return '';
    }

    return '$path.$extension';
  }

  /// parse map to object
  static fromJson(Map<String, dynamic> map) {
    return Thumbnail(
      path: JsonUtility.getStringValueFromMap(map, keyPath, ''),
      extension: JsonUtility.getStringValueFromMap(map, keyExtension, ''),
    );
  }

  /// convert object to map
  Map<String, dynamic> toMap() {
    return {
      keyPath: path,
      keyExtension: extension,
    };
  }
}