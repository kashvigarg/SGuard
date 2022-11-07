// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserModel {
  final String? name;
  final List<String>? status;
  final DateTime? dob;
  final String? contact1;
  final String? contact2;
  UserModel({
    required this.name,
    required this.status,
    required this.dob,
    required this.contact1,
    required this.contact2,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      dob: data?['state'],
      contact1: data?['contact1'],
      contact2: data?['contact2'],
      status: data?['status'] is Iterable ? List.from(data?['status']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (dob != null) "dob": dob,
      if (contact1 != null) "contact1": contact1,
      if (contact2 != null) "contact2": contact2,
      if (status != null) "status": status,
    };
  }
}
  // UserModel(
  //     {this.id = '',
  //     required this.name,
  //     required this.status,
  //     required this.dob,
  //     required this.contact1,
  //     required this.contact2});

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'status': status,
  //       'dob': dob,
  //       'contact1': contact1,
  //       'contact2': contact2
  //     };

  // static UserModel fromJson(Map<String, dynamic> json) => UserModel(
  //     name: json['name'],
  //     status: json['status'],
  //     dob: json['dob'],
  //     contact1: json['contact1'],
  //     contact2: json['contact2']);

  // UserModel copyWith({
  //   String? id,
  //   String? name,
  //  // Status? status,
  //   DateTime? dob,
  //   String? contact1,
  //   String? contact2,
  // }) {
  //   return UserModel(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //    // status: status ?? this.status,
  //     dob: dob ?? this.dob,
  //     contact1: contact1 ?? this.contact1,
  //     contact2: contact2 ?? this.contact2,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //    // 'status': status.toMap(),
  //     'dob': dob.millisecondsSinceEpoch,
  //     'contact1': contact1,
  //     'contact2': contact2,
  //   };
  // }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     id: map['id'] as String,
  //     name: map['name'] as String,
  //     //status: Status.fromMap(map['status'] as Map<String, dynamic>),
  //     dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
  //     contact1: map['contact1'] as String,
  //     contact2: map['contact2'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'UserModel(id: $id, name: $name, dob: $dob, contact1: $contact1, contact2: $contact2)';
  // }

  // @override
  // bool operator ==(covariant UserModel other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.name == name &&
  //      // other.status == status &&
  //       other.dob == dob &&
  //       other.contact1 == contact1 &&
  //       other.contact2 == contact2;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //      // status.hashCode ^
  //       dob.hashCode ^
  //       contact1.hashCode ^
  //       contact2.hashCode;
  // }
// }

// enum Status {
//   SeniorCitizen("ABC"),
//   Adolescent(""),
//   Below18("");

//   final String name;

//   const Status(this.name);
// }

//enhanced enum