part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeCategoryChanged extends HomeEvent {
  /// selected category
  final Category category;

  const HomeCategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}