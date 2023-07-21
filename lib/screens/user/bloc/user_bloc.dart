import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial(user: init())) {

    /// user sign up
    on<UserSignedUp>((event, emit) {
      final User user = event.user;

      emit(state.copyWith(user: user));
    });

  }

  /// test init
  static User init() {
    return const User(
      firstName: 'Shivani',
      lastName: '',
      location: 'ABC Road, LA',
      avatar: 'assets/images/avatar.jpg',
    );
  }
}