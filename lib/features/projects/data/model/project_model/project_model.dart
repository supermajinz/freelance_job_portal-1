import 'package:equatable/equatable.dart';

import 'client.dart';
import 'project_category.dart';
import 'project_skill.dart';

class ProjectModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final int? minBudget;
  final int? maxBudget;
  final dynamic expectedDuration;
  final String? status;
  final DateTime? createDate;
  final Client? client;
  final dynamic worker;
  final List<ProjectCategory>? projectCategories;
  final List<ProjectSkill>? projectSkill;

  const ProjectModel({
    this.id,
    this.name,
    this.description,
    this.minBudget,
    this.maxBudget,
    this.expectedDuration,
    this.status,
    this.createDate,
    this.client,
    this.worker,
    this.projectCategories,
    this.projectSkill,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        minBudget: json['minBudget'] as int?,
        maxBudget: json['maxBudget'] as int?,
        expectedDuration: json['ExpectedDuration'] as dynamic,
        status: json['status'] as String?,
        createDate: json['createDate'] == null
            ? null
            : DateTime.parse(json['createDate'] as String),
        client: json['client'] == null
            ? null
            : Client.fromJson(json['client'] as Map<String, dynamic>),
        worker: json['worker'] as dynamic,
        projectCategories: (json['projectCategories'] as List<dynamic>?)
            ?.map((e) => ProjectCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        projectSkill: (json['projectSkill'] as List<dynamic>?)
            ?.map((e) => ProjectSkill.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'minBudget': minBudget,
        'maxBudget': maxBudget,
        'ExpectedDuration': expectedDuration,
        'status': status,
        'createDate': createDate?.toIso8601String(),
        'client': client?.toJson(),
        'worker': worker,
        'projectCategories': projectCategories?.map((e) => e.toJson()).toList(),
        'projectSkill': projectSkill?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      minBudget,
      maxBudget,
      expectedDuration,
      status,
      createDate,
      client,
      worker,
      projectCategories,
      projectSkill,
    ];
  }
}
