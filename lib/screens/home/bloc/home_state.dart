part of 'home_bloc.dart';

/// start state
final class HomeState extends Equatable {
  /// loading progress
  final bool loading;

  /// search key
  final String searchKey;

  final Category category;

  final MarvelData marvelData;

  const HomeState({
    required this.loading,
    required this.searchKey,
    required this.category,
    required this.marvelData,
  });

  HomeState.initial({
    bool? loading,
    String? searchKey,
    Category? category,
    MarvelData? marvelData,
  }) : this(
    loading: loading ?? false,
    searchKey: searchKey ?? '',
    category: category ?? const Category(label: Category.comics),
    marvelData: marvelData ?? MarvelData.fromJson({}),
  );

  HomeState copyWith({
    bool? loading,
    String? searchKey,
    Category? category,
    MarvelData? marvelData,
    List<Portfolio>? portfolios,
  }) {
    return HomeState(
        loading: loading ?? this.loading,
        searchKey: searchKey ?? this.searchKey,
        category: category ?? this.category,
        marvelData: marvelData ?? this.marvelData,
    );
  }

  @override
  List<Object?> get props => [loading, searchKey, category, marvelData];

}