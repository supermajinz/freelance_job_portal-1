// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? role;
  final String? device_token;

  const User(
      {this.id = 0,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      this.role = "CLIENT_WORKER",
      this.device_token = "dsa"});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
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
        'device_token': device_token,
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
