import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/offers/data/model/offers_model/category_dto.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/photo_dt_o.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/skill_dt_o.dart';
import 'package:freelance_job_portal/features/profile/data/models/profile/user_dto.dart';
import 'package:freelance_job_portal/features/projects/data/model/project_model/job_title_dto.dart';

class WorkerProfile extends Equatable {
  final int? id;
  final String? bio;
  final int? userId;
  final double? rate;
  final JobTitleDto? jobTitleDto;
  final CategoryDto? categoryDto;
  final List<PhotoDtO>? photoDtOs;
  final List<SkillDtO>? skillDtOs;
  final UserDto? userDto;
  final int? completedProjectsCount;

  const WorkerProfile({
    this.id,
    this.bio,
    this.userId,
    this.rate,
    this.jobTitleDto,
    this.categoryDto,
    this.photoDtOs,
    this.skillDtOs,
    this.userDto,
    this.completedProjectsCount,
  });

  factory WorkerProfile.fromMap(Map<String, dynamic> data) => WorkerProfile(
        id: data['id'] as int?,
        bio: data['bio'] as String?,
        userId: data['userId'] as int?,
        rate: (data['rate'] as num?)?.toDouble(),
        jobTitleDto: data['jobTitleDTO'] == null
            ? null
            : JobTitleDto.fromJson(data['jobTitleDTO'] as Map<String, dynamic>),
        categoryDto: data['categoryDTO'] == null
            ? null
            : CategoryDto.fromJson(data['categoryDTO'] as Map<String, dynamic>),
        photoDtOs: (data['photoDTOs'] as List<dynamic>?)
            ?.map((e) => PhotoDtO.fromMap(e as Map<String, dynamic>))
            .toList(),
        skillDtOs: (data['skillDTOs'] as List<dynamic>?)
            ?.map((e) => SkillDtO.fromMap(e as Map<String, dynamic>))
            .toList(),
        userDto: data['userDTO'] == null
            ? null
            : UserDto.fromMap(data['userDTO'] as Map<String, dynamic>),
        completedProjectsCount: data['completedProjectsCount'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'bio': bio,
        'userId': userId,
        'rate': rate,
        'jobTitleDTO': jobTitleDto?.toJson(),
        'categoryDTO': categoryDto?.toJson(),
        'photoDTOs': photoDtOs?.map((e) => e.toMap()).toList(),
        'skillDTOs': skillDtOs?.map((e) => e.toMap()).toList(),
        'userDTO': userDto?.toMap(),
        'completedProjectsCount': completedProjectsCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WorkerProfile].
  factory WorkerProfile.fromJson(String data) {
    return WorkerProfile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WorkerProfile] to a JSON string.
  String toJson() => json.encode(toMap());

  WorkerProfile copyWith({
    int? id,
    String? bio,
    int? userId,
    double? rate,
    JobTitleDto? jobTitleDto,
    CategoryDto? categoryDto,
    List<PhotoDtO>? photoDtOs,
    List<SkillDtO>? skillDtOs,
    UserDto? userDto,
    int? completedProjectsCount,
  }) {
    return WorkerProfile(
      id: id ?? this.id,
      bio: bio ?? this.bio,
      userId: userId ?? this.userId,
      rate: rate ?? this.rate,
      jobTitleDto: jobTitleDto ?? this.jobTitleDto,
      categoryDto: categoryDto ?? this.categoryDto,
      photoDtOs: photoDtOs ?? this.photoDtOs,
      skillDtOs: skillDtOs ?? this.skillDtOs,
      userDto: userDto ?? this.userDto,
      completedProjectsCount:
          completedProjectsCount ?? this.completedProjectsCount,
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
      categoryDto,
      photoDtOs,
      skillDtOs,
      userDto,
      completedProjectsCount,
    ];
  }

  @override
  String toString() {
    return 'WorkerProfile(id: $id, bio: $bio, userId: $userId, rate: $rate, jobTitleDto: $jobTitleDto, categoryDto: $categoryDto, photoDtOs: $photoDtOs, skillDtOs: $skillDtOs, userDto: $userDto, completedProjectsCount: $completedProjectsCount)';
  }
}
