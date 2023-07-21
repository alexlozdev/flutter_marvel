part of 'home_bloc.dart';

/// start state
final class HomeState extends Equatable {
  final Category category;

  final List<Good> goods;

  final List<Portfolio> portfolios;

  const HomeState({
    required this.category,
    required this.goods,
    required this.portfolios,
  });

  HomeState.initial({List<Good>? goods, List<Portfolio>? portfolios})
      : this(category: Category.all[0], goods: goods ?? [], portfolios: portfolios ?? []);

  HomeState copyWith({
    Category? category,
    List<Good>? goods,
    List<Portfolio>? portfolios,
  }) {
    return HomeState(
        category: category ?? this.category,
        goods: goods ?? this.goods,
        portfolios: portfolios ?? this.portfolios,
    );
  }

  @override
  List<Object?> get props => [category, goods, portfolios];

}