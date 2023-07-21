part of 'start_bloc.dart';

/// start state
final class StartState extends Equatable {
  final PageItem pageItem;

  const StartState({required this.pageItem});

  StartState.initial()
      : this(pageItem: PageItem.pages[0]);

  StartState copyWith({PageItem? pageItem}) {
    return StartState(
      pageItem: pageItem ?? this.pageItem
    );
  }

  @override
  List<Object?> get props => [pageItem];

}