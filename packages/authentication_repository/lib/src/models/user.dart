import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.status, this.dob, this.address,
      {required this.name, required this.email});

  final String name;
  final String email;
  final String? status;
  final String? dob;
  final String? address;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(null, null, null, name: '', email: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [name, email, status, dob, address];
}
