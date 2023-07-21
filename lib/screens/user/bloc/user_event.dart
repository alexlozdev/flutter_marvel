part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class UserSignedUp extends UserEvent {
  /// current user
  final User user;

  const UserSignedUp(this.user);

  @override
  List<Object> get props => [user];
}