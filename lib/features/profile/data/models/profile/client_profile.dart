import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'job_title_dto.dart';
import 'photo_dt_o.dart';
import 'skill_dt_o.dart';
import 'user_dto.dart';

class ClientProfile extends Equatable {
  final int? id;
  final String? bio;
  final int? userId;
  final double? rate;
  final JobTitleDto? jobTitleDto;
  final List<PhotoDtO>? photoDtOs;
  final List<SkillDtO>? skillDtOs;
  final UserDto? userDto;

  const ClientProfile({
    this.id,
    this.bio,
    this.userId,
    this.rate,
    this.jobTitleDto,
    this.photoDtOs,
    this.skillDtOs,
    this.userDto,
  });

  factory ClientProfile.fromMap(Map<String, dynamic> data) => ClientProfile(
        id: data['id'] as int?,
        bio: data['bio'] as String?,
        userId: data['userId'] as int?,
        rate: (data['rate'] as num?)?.toDouble(),
        jobTitleDto: data['jobTitleDTO'] == null
            ? null
            : JobTitleDto.fromMap(data['jobTitleDTO'] as Map<String, dynamic>),
        photoDtOs: (data['photoDTOs'] as List<dynamic>?)
            ?.map((e) => PhotoDtO.fromMap(e as Map<String, dynamic>))
            .toList(),
        skillDtOs: (data['skillDTOs'] as List<dynamic>?)
            ?.map((e) => SkillDtO.fromMap(e as Map<String, dynamic>))
            .toList(),
        userDto: data['userDTO'] == null
            ? null
            : UserDto.fromMap(data['userDTO'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'bio': bio,
        'userId': userId,
        'rate': rate,
        'jobTitleDTO': jobTitleDto?.toMap(),
        'photoDTOs': photoDtOs?.map((e) => e.toMap()).toList(),
        'skillDTOs': skillDtOs?.map((e) => e.toMap()).toList(),
        'userDTO': userDto?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ClientProfile].
  factory ClientProfile.fromJson(String data) {
    return ClientProfile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ClientProfile] to a JSON string.
  String toJson() => json.encode(toMap());

  ClientProfile copyWith({
    int? id,
    String? bio,
    int? userId,
    double? rate,
    JobTitleDto? jobTitleDto,
    List<PhotoDtO>? photoDtOs,
    List<SkillDtO>? skillDtOs,
    UserDto? userDto,
  }) {
    return ClientProfile(
      id: id ?? this.id,
      bio: bio ?? this.bio,
      userId: userId ?? this.userId,
      rate: rate ?? this.rate,
      jobTitleDto: jobTitleDto ?? this.jobTitleDto,
      photoDtOs: photoDtOs ?? this.photoDtOs,
      skillDtOs: skillDtOs ?? this.skillDtOs,
      userDto: userDto ?? this.userDto,
    );
  }

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
