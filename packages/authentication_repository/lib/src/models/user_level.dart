import 'package:equatable/equatable.dart';

class UserLevel extends Equatable {
  final String profLevel;

  UserLevel({required this.profLevel});
  @override
  List<Object?> get props => throw UnimplementedError();
}

enum level { user, admin, superAdmin }
