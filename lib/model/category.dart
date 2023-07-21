import 'package:equatable/equatable.dart';

final class Category extends Equatable {

  /// category labels
  static const String news = 'NEWS';
  static const String comics = 'COMICS';
  static const String characters = 'CHARACTERS';
  static const String movies = 'MOVIES';
  static const String tvShows = 'TV SHOWS';
  static const String games = 'GAMES';
  static const String videos = 'VIDEOS';
  static const String lifestyle = 'LIFESTYLE';
  static const String rolePlayingGame = 'ROLE-PLAYING GAME';
  static const String books = 'BOOKS';
  static const String podcasts = 'PODCASTS';
  static const String shop = 'SHOP';

  /// pages
  static const all = [
    Category(label: news,),
    Category(label: comics,),
    Category(label: characters,),
    Category(label: movies,),
    Category(label: tvShows,),
    Category(label: games,),
    Category(label: videos,),
    Category(label: lifestyle,),
    Category(label: rolePlayingGame,),
    Category(label: books,),
    Category(label: podcasts),
    Category(label: shop),
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