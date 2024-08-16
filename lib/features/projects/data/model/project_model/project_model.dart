import 'package:freelance_job_portal/features/home/data/model/caregories/caregories.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/offers/data/model/offers_model/worker.dart';
import 'client.dart';

class ProjectModel {
  final int id;
  String name;
  String description;
  int minBudget;
  int maxBudget;
  int expectedDuration;
  int offerCount;
  Categories? projectCategory;
  List<Skills> projectSkill;
   String status;
  final DateTime? createDate;
  final Client? client;
  final Worker? worker;
  static const projectStatuses = [
    'open',
    'inProgress',
    'submitted',
    'completed'
  ];

  ProjectModel({
    this.id = 1,
    this.name = "Project Name",
    this.description = "Project Description",
    this.minBudget = 1000000,
    this.maxBudget = 7000000,
    this.expectedDuration = 50,
    this.offerCount = 0,
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
        worker: json['worker'] == null
            ? null
            : Worker.fromJson(json['worker'] as Map<String, dynamic>),
        projectCategory: Categories.fromJson(
            json["projectCategory"] as Map<String, dynamic>),
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
        'offerCount': offerCount,
        'status': status,
        'createDate': createDate?.toIso8601String(),
        'client': client?.toJson(),
        'worker': worker,
        'projectCategory': projectCategory?.toJson(),
        'projectSkill': projectSkill.map((e) => e.toJson()).toList(),
      };

  ProjectModel copyWith({
    int? id,
    String? name,
    String? description,
    int? minBudget,
    int? maxBudget,
    int? expectedDuration,
    int? offerCount,
    String? status,
    DateTime? createDate,
    Client? client,
    Worker? worker,
    Categories? projectCategory,
    List<Skills>? projectSkill,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      expectedDuration: expectedDuration ?? this.expectedDuration,
      offerCount: offerCount ?? this.offerCount,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      client: client ?? this.client,
      worker: worker ?? this.worker,
      projectCategory: projectCategory ?? this.projectCategory,
      projectSkill: projectSkill ?? this.projectSkill,
    );
  }

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        minBudget.hashCode ^
        maxBudget.hashCode ^
        expectedDuration.hashCode ^
        offerCount.hashCode ^
        status.hashCode ^
        createDate.hashCode ^
        client.hashCode ^
        worker.hashCode ^
        projectCategory.hashCode ^
        projectSkill.hashCode;
  }

  void update(ProjectModel project) {
    name = project.name;
    description = project.description;
    minBudget = project.minBudget;
    maxBudget = project.maxBudget;
    expectedDuration = project.expectedDuration;
    offerCount = project.offerCount;
    projectCategory = project.projectCategory;
    projectSkill = project.projectSkill;
  }
}
