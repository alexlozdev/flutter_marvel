part of 'home_bloc.dart';

/// start state
final class HomeState extends Equatable {
  /// loading progress
  final bool loading;

  final Category category;

  final MarvelData marvelData;

  final List<Portfolio> portfolios;

  const HomeState({
    required this.loading,
    required this.category,
    required this.marvelData,
    required this.portfolios,
  });

  HomeState.initial({bool? loading, Category? category, MarvelData? marvelData, List<Portfolio>? portfolios})
      : this(
          loading: loading ?? false,
          category: category ?? const Category(label: ''),
          marvelData: marvelData ?? MarvelData.fromJson({}),
          portfolios: portfolios ?? []
        );

  HomeState copyWith({
    bool? loading,
    Category? category,
    MarvelData? marvelData,
    List<Portfolio>? portfolios,
  }) {
    return HomeState(
        loading: loading ?? this.loading,
        category: category ?? this.category,
        marvelData: marvelData ?? this.marvelData,
        portfolios: portfolios ?? this.portfolios,
    );
  }

  @override
  List<Object?> get props => [loading, category, marvelData, portfolios];

}