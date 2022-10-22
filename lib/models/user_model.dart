class User {
  String id;
  final String name;
  final Status status;
  final DateTime dob;
  final String contact1;
  final String contact2;

  User(
      {this.id = '',
      required this.name,
      required this.status,
      required this.dob,
      required this.contact1,
      required this.contact2});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'dob': dob,
        'contact1': contact1,
        'contact2': contact2
      };

  static User fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      status: json['status'],
      dob: json['dob'],
      contact1: json['contact1'],
      contact2: json['contact2']);
}

enum Status { SeniorCitizen, Adolescent, Below18 }
