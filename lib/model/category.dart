import 'package:equatable/equatable.dart';

final class Category extends Equatable {

  /// category labels
  static const String comics = 'COMICS';
  static const String characters = 'CHARACTERS';
  static const String series = 'SERIES';
  static const String creators = 'CREATORS';
  static const String events = 'EVENTS';
  static const String stories = 'STORIES';


  /// pages
  static const all = [
    Category(label: comics,),
    Category(label: characters,),
    Category(label: series,),
    Category(label: creators,),
    Category(label: events,),
    Category(label: stories,),

  ];

  /// page name
  final String label;

  const Category({
    required this.label,
  });

  Category copyWith({String? label,}) {
    return Category(
      label: label ?? this.label,
    );
  }

  @override
  List<Object?> get props => [label];

}