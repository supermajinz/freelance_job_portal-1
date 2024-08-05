import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/offers/data/model/offer_model/worker.dart';

import 'client.dart';
import 'project_category.dart';
import 'project_skill.dart';

class ProjectModel extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final int? minBudget;
  final int? maxBudget;
  final dynamic expectedDuration;
  final String? status;
  final DateTime? createDate;
  final Client? client;
  final Worker? worker;
  final Categories projectCategory;
  final List<Skills>? projectSkill;

  const ProjectModel({
    this.id = 1,
    this.name = "Project name",
    this.description = "Project Description",
    this.minBudget = 100000,
    this.maxBudget = 800000,
    this.expectedDuration = 60,
    this.status = "open",
    this.createDate,
    this.client,
    this.worker,
    this.projectCategory = const Categories(id: 1, name: "name"),
    this.projectSkill,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['id'] as int,
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
        projectCategory: Categories.fromJson(json['projectCategories'] as Map<String, dynamic>),
        projectSkill: (json['projectSkill'] as List<dynamic>?)
            ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
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
        'projectCategories': projectCategory?.map((e) => e.toJson()).toList(),
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
      projectCategory,
      projectSkill,
    ];
  }
}
