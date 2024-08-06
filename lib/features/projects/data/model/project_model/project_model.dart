import 'package:equatable/equatable.dart';
import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';

import 'client.dart';

class ProjectModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int minBudget;
  final int maxBudget;
  final int expectedDuration;
  final int offerCount;
  final String status;
  final DateTime? createDate;
  final Client? client;
  final dynamic worker;
 final Categories? projectCategory;
  final List<Skills> projectSkill;

  const ProjectModel({
    this.id = 1,
    this.name = "Project Name",
    this.description = "Project Description",
    this.minBudget = 1000000,
    this.maxBudget = 7000000,
    this.expectedDuration = 50,
    this.offerCount=0,
    this.status = "open",
    this.createDate,
    this.client,
    this.worker,
    this.projectCategory,
    this.projectSkill = const [],
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        minBudget: json['minBudget'] as int,
        maxBudget: json['maxBudget'] as int,
        expectedDuration: json['ExpectedDuration'] ?? 50,
        offerCount: json['offerCount'] as int,
        status: json['status'] as String,
        createDate: json['createDate'] == null
            ? DateTime.now()
            : DateTime.parse(json['createDate'] as String),
        client: Client.fromJson(json['client'] as Map<String, dynamic>),
        worker: json['worker'] as dynamic,
         projectCategory: Categories.fromJson(json["projectCategory"] as Map<String, dynamic>),
        projectSkill: ((json['projectSkill'] ?? []) as List<dynamic>)
            .map((e) => Skills.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'minBudget': minBudget,
        'maxBudget': maxBudget,
        'ExpectedDuration': expectedDuration,
        'offerCount':offerCount,
        'status': status,
        'createDate': createDate?.toIso8601String(),
        'client': client?.toJson(),
        'worker': worker,
        'projectCategory':projectCategory?.toJson(),
        'projectSkill': projectSkill.map((e) => e.toJson()).toList(),
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
      offerCount,
      status,
      createDate,
      client,
      worker,
      projectCategory,
      projectSkill,
    ];
  }
}
