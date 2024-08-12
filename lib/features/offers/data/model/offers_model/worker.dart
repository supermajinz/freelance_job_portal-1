import 'package:equatable/equatable.dart';

import '../../../../home/data/model/skills/skills.dart';
import 'category_dto.dart';
import 'job_title_dto.dart';
import 'user_dto.dart';

class Worker extends Equatable {
  final int? id;
  final String? bio;
  final int? userId;
  final double? rate;
  final JobTitleDto? jobTitleDto;
  final CategoryDto? categoryDto;
  final List<dynamic>? photoDtOs;
  final List<Skills>? skillDtOs;
  final UserDto? userDto;

  const Worker({
    this.id,
    this.bio,
    this.userId,
    this.rate,
    this.jobTitleDto,
    this.categoryDto,
    this.photoDtOs,
    this.skillDtOs,
    this.userDto,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        id: json['id'] as int?,
        bio: json['bio'] as String?,
        userId: json['userId'] as int?,
        rate: (json['rate'] as num?)?.toDouble(),
        jobTitleDto: json['jobTitleDTO'] == null
            ? null
            : JobTitleDto.fromJson(json['jobTitleDTO'] as Map<String, dynamic>),
        categoryDto: json['categoryDTO'] == null
            ? null
            : CategoryDto.fromJson(json['categoryDTO'] as Map<String, dynamic>),
        photoDtOs: json['photoDTOs'] as List<dynamic>?,
        skillDtOs: ((json['skillDTOs'] ?? []) as List<dynamic>)
            .map((e) => Skills.fromJson(e as Map<String, dynamic>))
            .toList(),
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
        'categoryDTO': categoryDto?.toJson(),
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
      categoryDto,
      photoDtOs,
      skillDtOs,
      userDto,
    ];
  }
}
