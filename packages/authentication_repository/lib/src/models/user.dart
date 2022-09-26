import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.name, required this.email});

  final String name;
  final String email;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(name: '', email: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [name, email];
}
