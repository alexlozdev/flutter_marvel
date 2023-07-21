part of 'start_bloc.dart';

sealed class StartEvent extends Equatable {
  const StartEvent();

  @override
  List<Object?> get props => [];
}

final class StartPageChanged extends StartEvent {
  /// page name
  final PageItem pageItem;

  const StartPageChanged(this.pageItem);

  @override
  List<Object> get props => [pageItem];
}