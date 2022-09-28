import 'package:equatable/equatable.dart';

class RegisterForm extends Equatable {
  final String name;
  final String status;
  final String dob;
  final String address;
  final String primaryContact;

  RegisterForm(
      this.name, this.status, this.dob, this.address, this.primaryContact);

  @override
  List<Object?> get props => [name, status, dob, address, primaryContact];
}

enum status { female, kid, senior }

// Name
// Status: Female / Kid / Senior Citizen
// DOB
// Address
// Profile
// Emergency Contact Numbers upto 4