import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/page_item.dart';

part 'start_event.dart';
part 'start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(StartState.initial()) {

    /// change selected page
    on<StartPageChanged>((event, emit) {
      /*
      emit(state.copyWith(
          pageItem: state.pageItem.copyWith(
              name: event.pageItem.name,
              icon: event.pageItem.icon,
          )
      ));
       */
      emit(state.copyWith(
          pageItem: event.pageItem,
      ));
    });


  }
}