import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;
  final int? points;
  final String? status;

  const UserDto({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.points,
    this.status,
  });

  factory UserDto.fromMap(Map<String, dynamic> data) => UserDto(
        id: data['id'] as int?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        points: data['points'] as int?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'points': points,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDto].
  factory UserDto.fromJson(String data) {
    return UserDto.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDto] to a JSON string.
  String toJson() => json.encode(toMap());

  UserDto copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    int? points,
    String? status,
  }) {
    return UserDto(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      points: points ?? this.points,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstname,
      lastname,
      phone,
      email,
      points,
      status,
    ];
  }
}
