part of 'user_bloc.dart';

/// start state
final class UserState extends Equatable {
  final User user;

  const UserState({required this.user});

  UserState.initial({User? user})
      : this(user: user ?? const User());

  UserState copyWith({User? user}) {
    return UserState(
        user: user ?? this.user
    );
  }

  @override
  List<Object?> get props => [user];

}