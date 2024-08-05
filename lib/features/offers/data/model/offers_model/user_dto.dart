import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;
  final int? points;
  final String? status;
  final String? deviceToken;

  const UserDto({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.points,
    this.status,
    this.deviceToken,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['id'] as int?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        points: json['points'] as int?,
        status: json['status'] as String?,
        deviceToken: json['device_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'points': points,
        'status': status,
        'device_token': deviceToken,
      };

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
      deviceToken,
    ];
  }
}
