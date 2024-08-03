import 'package:equatable/equatable.dart';

import 'job_title_dto.dart';
import 'user_dto.dart';

class Client extends Equatable {
  final int? id;
  final String? bio;
  final int? userId;
  final double? rate;
  final JobTitleDto? jobTitleDto;
  final List<dynamic>? photoDtOs;
  final List<dynamic>? skillDtOs;
  final UserDto? userDto;

  const Client({
    this.id,
    this.bio,
    this.userId,
    this.rate,
    this.jobTitleDto,
    this.photoDtOs,
    this.skillDtOs,
    this.userDto,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'] as int?,
        bio: json['bio'] as String?,
        userId: json['userId'] as int?,
        rate: (json['rate'] as num?)?.toDouble(),
        jobTitleDto: json['jobTitleDTO'] == null
            ? null
            : JobTitleDto.fromJson(json['jobTitleDTO'] as Map<String, dynamic>),
        photoDtOs: json['photoDTOs'] as List<dynamic>?,
        skillDtOs: json['skillDTOs'] as List<dynamic>?,
        userDto: json['userDTO'] == null
            ? null
            : UserDto.fromJson(json['userDTO'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'bio': bio,
        'userId': userId,
        'rate': rate,
        'jobTitleDTO': jobTitleDto?.toJson(),
        'photoDTOs': photoDtOs,
        'skillDTOs': skillDtOs,
        'userDTO': userDto?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      bio,
      userId,
      rate,
      jobTitleDto,
      photoDtOs,
      skillDtOs,
      userDto,
    ];
  }
}
