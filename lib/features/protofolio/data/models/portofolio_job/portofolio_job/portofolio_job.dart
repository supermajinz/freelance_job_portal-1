import 'package:equatable/equatable.dart';

import 'photo_dt_o.dart';
import 'skill_dt_o.dart';

class PortofolioJob extends Equatable {
  final int? id;
  final int? workerProfileId;
  final String? name;
  final String? description;
  final int? viewsNo;
  final int? likeNo;
  final DateTime? date;
  final List<PhotoDtO>? photoDtOs;
  final List<SkillDtO>? skillDtOs;

  const PortofolioJob({
    this.id,
    this.workerProfileId,
    this.name,
    this.description,
    this.viewsNo,
    this.likeNo,
    this.date,
    this.photoDtOs,
    this.skillDtOs,
  });

  factory PortofolioJob.fromJson(Map<String, dynamic> json) => PortofolioJob(
        id: json['id'] as int?,
        workerProfileId: json['workerProfileId'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        viewsNo: json['viewsNo'] as int?,
        likeNo: json['likeNo'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        photoDtOs: (json['photoDTOs'] as List<dynamic>?)
            ?.map((e) => PhotoDtO.fromJson(e as Map<String, dynamic>))
            .toList(),
        skillDtOs: (json['skillDTOs'] as List<dynamic>?)
            ?.map((e) => SkillDtO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'workerProfileId': workerProfileId,
        'name': name,
        'description': description,
        'viewsNo': viewsNo,
        'likeNo': likeNo,
        'date': date?.toIso8601String(),
        'photoDTOs': photoDtOs?.map((e) => e.toJson()).toList(),
        'skillDTOs': skillDtOs?.map((e) => e.toJson()).toList(),
      };

  PortofolioJob copyWith({
    int? id,
    int? workerProfileId,
    String? name,
    String? description,
    int? viewsNo,
    int? likeNo,
    DateTime? date,
    List<PhotoDtO>? photoDtOs,
    List<SkillDtO>? skillDtOs,
  }) {
    return PortofolioJob(
      id: id ?? this.id,
      workerProfileId: workerProfileId ?? this.workerProfileId,
      name: name ?? this.name,
      description: description ?? this.description,
      viewsNo: viewsNo ?? this.viewsNo,
      likeNo: likeNo ?? this.likeNo,
      date: date ?? this.date,
      photoDtOs: photoDtOs ?? this.photoDtOs,
      skillDtOs: skillDtOs ?? this.skillDtOs,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      workerProfileId,
      name,
      description,
      viewsNo,
      likeNo,
      date,
      photoDtOs,
      skillDtOs,
    ];
  }
}
