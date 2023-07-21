import 'package:equatable/equatable.dart';

final class User extends Equatable {
  final String firstName;

  final String lastName;

  final String location;

  /// avatar image path
  final String avatar;

  /// login user info
  const User({
    this.firstName = '',
    this.lastName = '',
    this.location = '',
    this.avatar = '',
  });

  @override
  List<Object?> get props => [firstName, lastName, location, avatar];

  User copyWith({String? firstName, String? lastName, String? location, String? avatar}) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      location: location ?? this.location,
      avatar: avatar ?? this.avatar,
    );
  }
}