import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? role;

  const User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'role': role,
      };

  @override
  List<Object?> get props {
    return [
      firstname,
      lastname,
      email,
      phone,
      role,
    ];
  }
}
